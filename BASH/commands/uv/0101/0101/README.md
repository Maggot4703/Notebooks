# HelpMan
Linux command help and manual pages in html for the browser

The current Open WebUI host mapping treats `me@p48` as the 0101-side companion and uses `llama3.2:1b` as the shared small Ollama model.

Launch the matching companion from the sibling workspace:

```bash
cd /home/me/Notebooks/OPENWEBUI
uv sync
./openwebui-host.sh me@p48
```

## Startup Code

```bash
cd /home/me/Notebooks/0101/0101
uv sync
#uv run jupyter lab
uv run python /home/me/Notebooks/0101/0101/src/public_html/server.py
```
