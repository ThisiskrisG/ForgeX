# Server-side runner API for secure Python execution (optional)

Summary

Provide a secure server-side endpoint that can execute submitted Python code in a sandboxed environment. This will be an optional fallback for mobile users or when in-browser interpreters are not suitable.

Files touched

- server/ (new)
- api/runner (new)
- docs/runner.md (new)

Tasks

- [ ] Design API: POST /api/run { language, code }
- [ ] Implement sandboxing via containers or OS-level isolation (timeouts, memory limits)
- [ ] Implement authentication/rate limiting/logging
- [ ] Return structured response { stdout, stderr, exit_code, duration }
- [ ] Add tests and documentation

Security considerations

- Must strictly limit execution time and memory
- Avoid network access or restrict it via allowlists
- Sanitize inputs and logs

Acceptance criteria

- Server can safely execute short Python programs and return results
- Sandbox prevents resource exhaustion and escapes

Suggested labels: backend, security, api
