#!/usr/bin/env bash
set -euo pipefail

# Config — edit if you want different values
REPO="ThisiskrisG/ForgeX"
TAG="scroll-X"
TITLE="scroll X"
NOTES_FILE="releases/scroll-X/release-notes.md"
ASSET="Scrollforge_CollabIDE_file_manager/editor.html"
TARGET_BRANCH="main"
PUBLISH=false     # set to true or pass --publish

usage() {
  cat <<EOF
Usage: $0 [--publish] [--force-tag]
  --publish     Publish the release immediately (not draft)
  --force-tag   Recreate the annotated tag (delete & recreate) if it already exists
EOF
  exit 1
}

FORCE_TAG=false
while [[ "${#}" -gt 0 ]]; do
  case "$1" in
    --publish) PUBLISH=true; shift ;;
    --force-tag) FORCE_TAG=true; shift ;;
    -h|--help) usage ;;
    *) echo "Unknown arg: $1"; usage ;;
  esac
done

# Ensure running from repo root (basic check)
if [[ ! -d .git ]]; then
  echo "Error: run this from the repository root (where .git is present)."
  exit 2
fi

# Ensure required files exist
if [[ ! -f "$NOTES_FILE" ]]; then
  echo "Error: release notes file not found: $NOTES_FILE"
  exit 3
fi
if [[ ! -f "$ASSET" ]]; then
  echo "Error: asset file not found: $ASSET"
  exit 4
fi

# Create annotated tag if missing (or force recreate)
if git rev-parse --verify "refs/tags/$TAG" >/dev/null 2>&1; then
  if [[ "$FORCE_TAG" == "true" ]]; then
    echo "Tag $TAG exists — deleting and recreating (force)"
    git tag -d "$TAG"
    git push --delete origin "$TAG" || true
    git tag -a "$TAG" -m "$TITLE"
  else
    echo "Tag $TAG already exists — skipping tag creation."
  fi
else
  echo "Creating annotated tag $TAG"
  git tag -a "$TAG" -m "$TITLE"
fi

echo "Pushing tag $TAG to origin..."
git push origin "$TAG"

# Use gh CLI if available
if command -v gh >/dev/null 2>&1; then
  echo "gh CLI detected — creating release via gh"
  GH_CMD=(gh release create "$TAG" --title "$TITLE" --notes-file "$NOTES_FILE")
  if [[ "$PUBLISH" != "true" ]]; then
    GH_CMD+=(--draft)
  fi
  "${GH_CMD[@]}"
  echo "Uploading asset via gh..."
  gh release upload "$TAG" "$ASSET" --clobber
  echo "Done. Draft release created with tag $TAG (via gh)."
  if [[ "$PUBLISH" == "true" ]]; then
    echo "Release published."
  else
    echo "Release left as draft; review & publish in the GitHub UI when ready."
  fi
  exit 0
fi

# Fallback to curl + GITHUB_TOKEN
echo "gh CLI not found — will use GitHub API via curl."
if [[ -z "${GITHUB_TOKEN:-}" ]]; then
  echo "Error: GITHUB_TOKEN environment variable must be set to a token with repo scope."
  exit 5
fi

# Prepare body JSON (use jq if available, else python)
if command -v jq >/dev/null 2>&1; then
  BODY_JSON=$(jq -Rs . < "$NOTES_FILE")
else
  # python fallback to JSON-escape the file
  if command -v python3 >/dev/null 2>&1; then
    BODY_JSON=$(python3 - <<PY - "$NOTES_FILE"
import json,sys
print(json.dumps(open(sys.argv[1],'r',encoding='utf-8').read()))
PY
"$NOTES_FILE")
  else
    echo "Error: jq or python3 is required to JSON-escape the notes file for API usage."
    exit 6
  fi
fi

API="https://api.github.com/repos/$REPO/releases"
echo "Creating draft release via API..."
RESPONSE=$(curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{\"tag_name\":\"$TAG\",\"target_commitish\":\"$TARGET_BRANCH\",\"name\":\"$TITLE\",\"body\":$BODY_JSON,\"draft\":true}" \
  "$API")

# Check for errors
if echo "$RESPONSE" | grep -q '"message":'; then
  # If it's success, it still contains JSON without top-level message; check for id
  if ! echo "$RESPONSE" | grep -q '"id"'; then
    echo "Release creation failed. Response:"
    echo "$RESPONSE" | sed -n '1,200p'
    exit 7
  fi
fi

RELEASE_ID=$(echo "$RESPONSE" | jq -r .id)
UPLOAD_URL_TEMPLATE=$(echo "$RESPONSE" | jq -r .upload_url)
UPLOAD_URL="${UPLOAD_URL_TEMPLATE%\{*}"

echo "Release created (id=$RELEASE_ID). Uploading asset..."
curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @"$ASSET" \
  "$UPLOAD_URL?name=$(basename "$ASSET")" >/dev/null

echo "Asset uploaded."

if [[ "$PUBLISH" == "true" ]]; then
  echo "Publishing release..."
  curl -s -X PATCH \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"draft":false}' \
    "$API/$RELEASE_ID" >/dev/null
  echo "Release published."
else
  echo "Release left as draft. Review it here:"
  echo "https://github.com/$REPO/releases/tag/$TAG"
fi
