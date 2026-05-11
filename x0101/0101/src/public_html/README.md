# public_html
 


Launch the matching Open WebUI companion from the sibling workspace:

```bash
cd /home/me/Notebooks/OPENWEBUI
uv sync
./openwebui-host.sh me@p48
```

## Startup Code

```bash
cd /home/me/Notebooks/0101/0101/src/public_html
uv sync
#uv run jupyter lab
#uv run python -m http.server
uv run python /home/me/Notebooks/0101/0101/src/public_html/server.py
```
