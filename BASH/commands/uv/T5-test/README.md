# Troubleshooting

- If you see `ModuleNotFoundError: No module named 'CREW'` or similar import errors, set your PYTHONPATH to include the parent Notebooks directory:

	```bash
	export PYTHONPATH="/home/me/Notebooks"
	uv run python t5_test.py
	```

- If you see `⚠  Run:  pip install speechrecognition pyaudio`, install the missing packages.
- If you get microphone errors, check your audio input device and permissions.
- For best results, use a quiet environment and a good microphone.
# T5-test

Small CLI test app for CardCutter + Crew utilities.

## Quick start

```bash
cd /home/me/Notebooks/T5-test
uv sync
uv run python t5_test.py --help
```

## Why this command

Use `uv run` from this folder so commands use the local `T5-test/.venv` environment.
This avoids interpreter drift from other workspace environments (for example `DICTATE/.venv`) that may not have all dependencies like `pandas`.

## Alternative explicit run

```bash
/home/me/Notebooks/T5-test/.venv/bin/python /home/me/Notebooks/T5-test/t5_test.py --help
```


## Startup Code

```bash
cd /home/me/Notebooks/T5-test
uv sync
#uv run jupyter lab
uv run python t5_test.py
```
