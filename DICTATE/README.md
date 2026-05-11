# DICTATE — Snazzy Voice-to-Text Dictaphone

A modern, stylish voice dictation app for Linux desktops. Records from your microphone and transcribes speech to text in a beautiful Tkinter GUI.

---

## Features
- One-click recording and transcription
- Animated microphone and waveform UI
- Word count and transcript preview
- Copy and clear transcript buttons
- Colorful, dark-themed interface
- Uses Google Speech Recognition (requires internet)

## Requirements
- Python 3.8+
- `speechrecognition` and `pyaudio` Python packages
- Tkinter (usually included with Python)

Install dependencies:
```bash
pip install speechrecognition pyaudio
```

## Usage
From the `DICTATE` directory:
```bash
python dictate.py
```

- Click the 🎤 button to start/stop recording.
- Speak clearly into your microphone.
- Transcript appears in the main panel.
- Use "Copy All" to copy the transcript to clipboard.

## Troubleshooting
- If you see `⚠  Run:  pip install speechrecognition pyaudio`, install the missing packages.
- If you get microphone errors, check your audio input device and permissions.
- For best results, use a quiet environment and a good microphone.

## Startup Script

To launch DICTATE in a clean environment, you can use a startup script like this:

```bash
deactivate 2>/dev/null || true
cd "/home/me/Notebooks/DICTATE"
uv sync --active
uv run --active python dictate.py
```

- This ensures you are in the correct directory and dependencies are installed.
- You can save this as `startup.txt` in the DICTATE folder for convenience.

## License
MIT License (see repository root for details)
