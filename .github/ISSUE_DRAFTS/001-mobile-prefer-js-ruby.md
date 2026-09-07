# Mobile: prefer JavaScript and Ruby on mobile clients

Summary

Detect mobile user agents, hide/disable the Python runtime in the editor UI, and default to JavaScript and Ruby. Display a short mobile banner letting users know Python is disabled on mobile and prefer JS/Ruby.

Files touched

- Scrollforge_CollabIDE_file_manager/editor.html
- Scrollforge_CollabIDE_file_manager/style.css

Tasks

- [ ] Implement UA-based detection and hide Python in selectors on mobile
- [ ] Default selection to JavaScript or Ruby on mobile
- [ ] Add a short informational banner on mobile that fades after a few seconds
- [ ] Test on Android/iOS browsers and desktop to ensure no regression

Acceptance criteria

- On mobile UAs, Python is not available as an option for execution in the editor UI
- The mobile banner appears and fades automatically
- Desktop behavior remains unchanged

Suggested labels: enhancement, mobile, frontend
