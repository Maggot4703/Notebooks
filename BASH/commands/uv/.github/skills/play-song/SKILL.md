---
name: play-song
description: "Use when: playing a random or specified song from /home/me/Music with VLC in minimized mode on a local desktop session."
---

# play-song Skill

## Purpose
Play song(s) from `/home/me/Music` or its subdirectories using VLC, ensuring VLC remains minimized. Handles song and folder names with spaces or special characters, and accepts an optional song-name query plus an optional numeric count.

## Usage
- Trigger this skill to play random or specified song(s) from the music library.
- VLC should launch in minimized mode and not interrupt the user's workspace.
- Prefer the helper script at `.github/skills/play-song/play-song.sh`.

## Implementation Guidelines
- Use `vlc` command-line options to play the file(s) and keep the window minimized (e.g., `--qt-start-minimized`).
- Search for audio files recursively in `/home/me/Music` (e.g., `.mp3`, `.flac`, `.wav`).
- If no song is specified, select one at random.
- If the first argument is a number, play that many different songs.
- If a song is also specified, match it against the file path case-insensitively and play that many different matching songs.
- Ensure only one VLC instance is started per invocation.
- Do not block the shell or script after launching VLC.
- Log the song(s) played (optional: for history).
- Handle song and folder names with spaces or special characters robustly.

## Example Bash Command
```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh
```

## Example With Song Name
```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh "Africa"
```

## Example With Count
```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh 3
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh 2 "Africa"
```

## Notes
- Requires VLC to be installed and available in PATH.
- This skill is intended for local desktop use, not remote/headless servers.
- Uses null-delimited filenames to safely handle spaces and special characters in both file and folder names.
- The helper script prints the selected song path or paths before launching VLC.
- If the requested count exceeds the number of matches, the script plays all available matches.