# 04 - Project Structure

This section lists the main files and directories used in ForgeX. Use this as a quick on-ramp when exploring the repository in the IDE.

Root layout (example):

```
ForgeX/
├── index.html          # Main entry point for the web app
├── index.md            # Project index used for GitHub Pages
├── README.md           # Repository landing page (links to docs/)
├── docs/               # Documentation (this paginated book)
│   ├── index.md
│   ├── intro.MD
│   ├── 02-Technology-Stack.md
│   ├── 03-Setup.md
│   └── 04-Project-Structure.md
├── Scrollforge_CollabIDE_file_manager/  # project-specific directory
├── LICENSE
└── CNAME
```

Developer notes
- Put implementation code in clear subfolders (src/, public/, assets/) as the project grows.
- Keep docs/ as the canonical documentation; link from README.md to docs/index.md.

---

[← Prev](03-Setup.md)
