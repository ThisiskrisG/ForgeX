# 02 - Technology Stack

This page summarizes the technology choices and recommendations for ForgeX. Use this as the canonical reference inside the repository and IDE.

Core
- Languages: HTML5, CSS3, JavaScript (ES2020+)
- Markup: Markdown for docs

Editor & UI
- Editor engine: Monaco Editor (recommended) — embeddable, VS Code-compatible
- UI: Lightweight components (plain HTML/CSS) or choose a framework: React / Svelte / Vue
- Styling: Tailwind CSS or plain CSS variables

Build & Tooling
- Bundler: Vite (fast dev server + build)
- Package manager: pnpm (recommended) or npm / yarn
- Linter & formatter: ESLint + Prettier
- Git hooks: Husky (pre-commit linting)

Backend & Storage (optional)
- Server: Node.js + Express (optional server mode)
- Local storage: IndexedDB for browser persistence
- Optional lightweight DB for server mode: SQLite

Editor Integration & Git
- Git integration: libgit2 bindings or call out to Git CLI
- Authentication: OAuth for remote providers (GitHub OAuth)

Testing & QA
- Unit tests: Jest
- Integration / E2E: Playwright or Cypress

CI / CD
- CI: GitHub Actions to run tests, linting, and optional build
- Docs publishing: GitHub Pages or GitHub Pages via GitHub Actions (for MkDocs/Vite-built site)

Containerization & Infra
- Container: Docker for reproducible dev environments
- Infra as code (optional): Terraform

Packaging / Desktop (optional)
- Electron (if packaging as desktop app)

Hosting
- Frontend: GitHub Pages (static) or Vercel/Netlify
- Backend: Cloud VM / App Service / ECS (if server mode)

Developer Tools
- Debugging: browser devtools, VS Code debugger
- Recommended extensions: ms-vscode.vscode-typescript-next, msjsdiag.debugger-for-chrome

License
- Apache License 2.0 (repository includes LICENSE)

---

[← Prev](intro.MD) | [Next →](03-Setup.md)
