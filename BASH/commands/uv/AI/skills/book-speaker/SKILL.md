# book-speaker Skill

**Purpose:**
Read aloud the text of a `.txt` file using text-to-speech (TTS).

**Features:**
- Reads any plain text file aloud, page by page or as a whole.
- Supports pausing, resuming, and skipping pages/sections (if implemented in the CLI or UI).
- Uses a cross-platform TTS engine (default: `pyttsx3` for offline, or `gTTS` for online/MP3 output).
- Designed for use with large RPG books, manuals, or any `.txt` file.

**Usage Example:**
```sh
python book_speaker.py /path/to/book.txt
```

**Best Practices:**
- Use `pyttsx3` for offline, fast, and robust TTS (no internet required).
- For batch/automated use, support command-line arguments for start page, end page, and voice selection.
- For large files, process and read one page/section at a time to minimize memory usage.
- Optionally, support output to MP3 for portable listening (with `gTTS`).

**Dependencies:**
- `pyttsx3` (offline TTS, cross-platform)
- Optionally: `gTTS` (Google Text-to-Speech, requires internet)

**Sample CLI:**
```sh
python book_speaker.py book.txt --start-page 10 --end-page 20 --voice male
```

**Error Handling:**
- Validate file existence and readability.
- Handle TTS engine errors gracefully.
- Warn if a page/section is empty or unreadable.

**Extensibility:**
- Add support for bookmarks, playback speed, or voice selection.
- Integrate with GUI or notebook for interactive use.
