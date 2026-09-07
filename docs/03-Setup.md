# 03 - Setup & Development

Quick start (local static dev):

1. Clone the repo:

```bash
git clone https://github.com/ThisiskrisG/ForgeX.git
cd ForgeX
```

2. Open the repository in your editor (VS Code or Codespaces).

3. If the project is purely static, you can serve the files with a small static server:

```bash
# using npm (if you add a package.json)
npx serve .
# or
python -m http.server 8000
```

4. For a modern dev flow (if using Vite):

```bash
# install deps (if package.json present)
pm install
# dev server
npm run dev
```

Notes for Codespaces / VS Code
- Open the repository in Codespaces or VS Code to view docs in the editor.
- The docs are located in docs/ and will be the first place contributors should look.

Contributing
1. Fork the repository
2. Create a branch: git checkout -b feature/your-feature
3. Make changes and commit
4. Open a PR against main

---

[← Prev](02-Technology-Stack.md) | [Next →](04-Project-Structure.md)
