# README_A2HS.md

Purpose

This file explains how to enable Add-to-Home-Screen (A2HS) for ForgeX using a web manifest and a minimal service worker. Follow these steps to test and update the A2HS files.

Files included

- manifest.json — web app manifest (update name, short_name, theme_color, icons)
- service-worker.js — minimal service worker used to meet PWA criteria and cache a few assets
- install-snippet.html — example install button + iOS fallback banner
- /assets/icons/ — placeholder icons

How to update

1. Update manifest.json values (name, short_name, start_url, icons).
2. Replace /assets/icons/icon-192.svg and icon-512.svg with proper icons. Prefer SVG or PNG at exact sizes.
3. If you change cached assets, bump CACHE_NAME in service-worker.js (e.g., 'forgex-v2').

Testing locally (HTTPS required)

- Option A: Use serve + ngrok
  - npm i -g serve
  - serve -s . -l 8080
  - ngrok http 8080
  - Open the ngrok HTTPS URL on Android Chrome

- Option B: Use Codespaces, Gitpod, or GitHub Pages which provide HTTPS by default.

Required manifest properties

- icons containing at least 192x192 and 512x512 sizes
- display: "standalone"
- start_url and scope set to appropriate values

Troubleshooting

- No install prompt: ensure HTTPS, check DevTools → Application → Manifest and Service Workers. Verify icons load and manifest is valid JSON.
- Manifest 404: check path (use /manifest.json) and server MIME types.
- Icons blurry: use exact pixel sizes (192 & 512) and a maskable 512 icon if you use rounded shapes.

Updating icons from an SVG

Recommended: keep a source SVG and generate raster icons with pwa-asset-generator or ImageMagick.

Example (ImageMagick):

convert logo.svg -resize 192x192 assets/icons/icon-192.png
convert logo.svg -resize 512x512 assets/icons/icon-512.png

