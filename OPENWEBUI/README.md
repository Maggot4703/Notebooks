# Open WebUI

This workspace records the local Open WebUI setup for the two main machines:

- **me@home** (this machine) → `CREW/Crew/Crew.py` → Open WebUI at http://127.0.0.1:3000
- **me@p48** (192.168.0.8) → `0101/0101/src/public_html/0101.html` → http://p48:8001/0101.html

## Quick Start

**On me@home (this machine):**
```bash
cd /home/me/Notebooks/OPENWEBUI
uv sync
./openwebui-serve.sh      # Start Open WebUI server
```

**On me@p48 (remote machine):**
```bash
cd /home/me/Notebooks/0101/0101/src/public_html
uv sync
uv run python server.py   # Start 0101 web server (port 8001)
```

Or use the auto-launcher:
```bash
cd /home/me/Notebooks/OPENWEBUI
uv sync
./openwebui-host.sh me@home   # or me@p48
```

## Access from Browser

**me@home Open WebUI:**
- Local: http://127.0.0.1:3000
- Network: http://home.Home:3000 (if mDNS available)

**me@p48 0101 web app:**
- Direct IP: http://192.168.0.8:8001/0101.html
- Hostname: http://p48:8001/0101.html (requires p48 in /etc/hosts)
  
Add to `/etc/hosts` on any machine to access by hostname:
```
192.168.0.8  p48  p48.Home
```

## Ollama Model

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
