# Publish mobile preview to GitHub Pages and verify release notes

Summary

Verify GitHub Pages publishes the editor preview for mobile and update release-notes.md Resources to point to the hosted page.

Files touched

- .github/workflows/pages.yml (if present)
- releases/scroll-X/release-notes.md

Tasks

- [ ] Confirm Pages is configured to publish site content at https://thisiskrisg.github.io/ForgeX/
- [ ] Verify the editor page is accessible at /Scrollforge_CollabIDE_file_manager/editor.html
- [ ] Update release-notes.md Resources section with the GitHub Pages URL if it differs
- [ ] Add a test checklist to ensure the hosted page loads and mobile banner behaves as expected

Acceptance criteria

- Hosted preview works via GitHub Pages and release notes point to the correct URL

Suggested labels: release, docs
