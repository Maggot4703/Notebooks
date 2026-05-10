# Open WebUI

This workspace records the local Open WebUI setup for the two main machines:

- `me@home` -> `CREW/Crew/Crew.py`
- `me@p48` -> `0101/0101/src/public_html/0101.html`

Use a small shared Ollama model that works on Raspberry Pi 4B and Pi 500 class hardware:

```bash
ollama pull llama3.2:1b
```

## Host launcher

Run the helper script to start the host-specific companion app:

```bash
uv sync
./openwebui-host.sh
```

You can pass an explicit host name if needed:

```bash
uv sync
./openwebui-host.sh me@home
uv sync
./openwebui-host.sh me@p48
```

## Open WebUI server

Start the actual Open WebUI server with a local data directory:

```bash
uv sync
./openwebui-serve.sh
```

The launcher uses a local SQLite file with a long busy timeout to avoid startup locking on Pi-class hardware.
It binds to `127.0.0.1:8081` so it can run alongside the existing 3000-port instance.

## Open WebUI pairing

- Use Open WebUI against the local Ollama instance on each machine.
- Keep the Crew app as the `me@home` companion.
- Keep the 0101 browser app as the `me@p48` companion.
- The launcher forces Open WebUI onto `OPENWEBUI/data/` so its SQLite DB stays local to this workspace.

## Installed Open WebUI items

- Skills: Crew Workspace Helper, 0101 Workspace Helper, Pi Model Helper
- Prompts: `/crew`, `/0101`, `/pi`
- Tool: Workspace Info
