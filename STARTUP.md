deactivate 2>/dev/null || true
cd /home/me/Notebooks/CREW/Crew
uv sync
uv run python Crew.py

========================================================================
========================================================================
PROGRAM STARTUP 
========================================================================

# Notebooks - /home/me/Notebooks/main.py
cd /home/me/Notebooks
uv sync
#uv run jupyter lab
uv run python main.py
========================================================================

# 0101 - /home/me/Notebooks/0101/0101/src/public_html/server.py
cd /home/me/Notebooks/0101/0101/src/public_html
uv sync
#uv run jupyter lab
#uv run python -m http.server
uv run python /home/me/Notebooks/0101/0101/src/public_html/server.py
========================================================================

# AI - /home/me/Notebooks/AI/main.py
cd /home/me/Notebooks/AI
uv sync
#uv run jupyter lab
uv run python main.py
========================================================================

# BASH - 
cd /home/me/Notebooks/BASH
uv sync
#uv run jupyter lab
uv run main.py
========================================================================

# CALIBRE
cd /home/me/Notebooks/CALIBRE
uv sync
#uv run jupyter lab
uv run main.py
========================================================================

# CARDCUTTER
cd /home/me/Notebooks/CARDCUTTER
uv sync
#uv run jupyter lab
uv run /home/me/Notebooks/CARDCUTTER/CardCutter/card_cutter.py
========================================================================

# CREW/Crew
deactivate 2>/dev/null || true
cd /home/me/Notebooks/CREW/Crew
uv sync
uv run python Crew.py
========================================================================

# DICTATE
deactivate 2>/dev/null || true
cd "/home/me/Notebooks/DICTATE"
uv sync --active
uv run --active python dictate.py
========================================================================

# JUPYTERLAB
cd /home/me/Notebooks/JUPYTERLAB
uv sync
#uv run jupyter lab
uv run python main.py
========================================================================

# Manuals - NOT YET!
========================================================================

# PYTHON - 
cd /home/me/Notebooks/PYTHON
uv sync
#uv run jupyter lab
uv run python main.py
========================================================================

# skills - NOT YET!
========================================================================

# T5-test - /home/me/Notebooks/T5-test/t5_test.py
cd /home/me/Notebooks/T5-test
uv sync
#uv run jupyter lab
uv run python t5_test.py
========================================================================

# TRAVELLERMAP
cd /home/me/Notebooks/TRAVELLERMAP
uv sync
#uv run jupyter lab
uv run main.py
========================================================================

# VTT
cd /home/me/Notebooks/VTT
uv sync
#uv run jupyter lab
uv run main.py
========================================================================

