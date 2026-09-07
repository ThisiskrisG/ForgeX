# Avatar upload: improve UX & persist selection

Summary

Improve the avatar upload experience in the editor header. Make the upload action discoverable, show thumbnail preview in the header, and persist the avatar selection using localStorage (or server-side storage later).

Files touched

- Scrollforge_CollabIDE_file_manager/editor.html
- Scrollforge_CollabIDE_file_manager/style.css

Tasks

- [ ] Replace the current hidden file input with an accessible labeled control in the header
- [ ] Show the uploaded avatar thumbnail in the header controls
- [ ] Persist avatar in localStorage and load it on startup
- [ ] Add ARIA labels and alt text for accessibility

Acceptance criteria

- Users can upload an avatar from the header and see a thumbnail immediately
- Avatar persists across page reloads
- UI is accessible (screen reader friendly)

Suggested labels: enhancement, ux
