Title: ollama_client.py — plan
Date: 2026-05-16

Referenced files:
- requests (external)

Summary:
OllamaClient provides a thin wrapper around the local ollama API with streaming support. It currently verifies connectivity in __init__ which can raise on construction.

Recommendations:
1. Avoid network calls in __init__; provide a separate connect()/verify() method to allow lazy verification and easier testing.
2. Add detailed type annotations and document generator semantics (what chunks look like).
3. Add retry/backoff options for transient errors and clearer exception types (custom exceptions: OllamaUnavailableError).
4. Add unit tests mocking requests; provide small integration test that skips if ollama not available.
5. Ensure timeouts and resource cleanup for streaming requests; allow configurable chunk parsing.
6. Add docstrings and PEP8 alignment.

Todos:
- [ ] Move verification out of __init__.
- [ ] Add custom exception classes and tests.
- [ ] Add documentation for usage patterns.
