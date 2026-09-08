# ForgeX icons and installation

This directory contains the SVG source assets for the ForgeX emblem and wordmark. The branch `feature/icons` contains these source files. Use the commands below to generate PNGs and favicon files from the SVGs.

Files added
- icons/forge-x-symbol.svg — symbol-only emblem (anvil + flame + X)
- icons/forge-x-wordmark.svg — symbol + "ForgeX" wordmark
- icons/forge-x-square.svg — square icon with solid charcoal background
- icons/forge-x-banner.svg — horizontal banner with wordmark and slogan
- site.webmanifest — manifest referencing PNG exports

Recommended conversions (requires ImageMagick or rsvg-convert/inkscape)

Using rsvg-convert (from librsvg):

rsvg-convert -w 512 -h 512 icons/forge-x-symbol.svg -o icons/forge-x-512.png
rsvg-convert -w 192 -h 192 icons/forge-x-symbol.svg -o icons/forge-x-192.png
rsvg-convert -w 180 -h 180 icons/forge-x-symbol.svg -o icons/forge-x-180.png
rsvg-convert -w 152 -h 152 icons/forge-x-symbol.svg -o icons/forge-x-152.png
rsvg-convert -w 144 -h 144 icons/forge-x-symbol.svg -o icons/forge-x-144.png
rsvg-convert -w 96 -h 96 icons/forge-x-symbol.svg -o icons/forge-x-96.png
rsvg-convert -w 72 -h 72 icons/forge-x-symbol.svg -o icons/forge-x-72.png
rsvg-convert -w 48 -h 48 icons/forge-x-symbol.svg -o icons/forge-x-48.png
rsvg-convert -w 32 -h 32 icons/forge-x-symbol.svg -o icons/forge-x-32.png
rsvg-convert -w 16 -h 16 icons/forge-x-symbol.svg -o icons/forge-x-16.png

# Generate square variant PNG from square SVG
rsvg-convert -w 512 -h 512 icons/forge-x-square.svg -o icons/forge-x-square.png

# Generate wordmark banner PNG
rsvg-convert -w 1200 -h 280 icons/forge-x-banner.svg -o icons/forge-x-banner.png

# Create favicon.ico (multi-size) using ImageMagick convert
# Ensure ImageMagick is installed (convert command available)
convert icons/forge-x-16.png icons/forge-x-32.png icons/forge-x-48.png icons/forge-x-64.png icons/forge-x-128.png icons/favicon.ico

# macOS / iOS: apple-touch-icon (use 180x180)
rsvg-convert -w 180 -h 180 icons/forge-x-symbol.svg -o icons/apple-touch-icon.png


HTML snippet (add to <head> of your site)

<link rel="apple-touch-icon" sizes="180x180" href="/icons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/icons/forge-x-32.png">
<link rel="icon" type="image/png" sizes="192x192" href="/icons/forge-x-192.png">
<link rel="manifest" href="/site.webmanifest">
<meta name="theme-color" content="#FF6A00">


Add-to-home-screen instructions

Android (Chrome):
1. Open the site in Chrome for Android.
2. Tap the menu (three dots) and choose "Add to Home screen" or if the app banner appears, tap it.
3. Confirm. Chrome will create an icon using the Web App Manifest icons.

iOS (Safari):
1. Open the site in Safari.
2. Tap the Share button and select "Add to Home Screen".
3. The site will be added with the apple-touch-icon if present.

Desktop (Windows/macOS):
- Windows (Edge/Chrome): use the browser menu -> More tools -> "Create shortcut..." and check "Open as window" for an app-like experience.
- macOS: drag the favicon from the address bar to the desktop (or use third-party wrappers to create an app).

Notes
- The repository contains SVG sources; generate PNG/ICO using the commands above and commit them to icons/ before relying on Pages or manifest.
- If you want, I can also push the generated PNGs and favicon for you if you allow me to create binary files here (I can encode them as base64 and push, but that will bloat the commit). Alternatively, generate locally and push.
