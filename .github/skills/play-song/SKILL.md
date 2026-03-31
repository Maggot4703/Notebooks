# play-song Skill

## Purpose
Play a song from `/home/me/Music` or its subdirectories using VLC, ensuring VLC remains minimized. Handles song and folder names with spaces or special characters.

## Usage
- Trigger this skill to play a random or specified song from the music library.
- VLC should launch in minimized mode and not interrupt the user's workspace.

## Implementation Guidelines
- Use `vlc` command-line options to play the file and keep the window minimized (e.g., `--qt-start-minimized`).
- Search for audio files recursively in `/home/me/Music` (e.g., `.mp3`, `.flac`, `.wav`).
- If no song is specified, select one at random.
- Ensure only one VLC instance is started per invocation.
- Do not block the shell or script after launching VLC.
- Log the song played (optional: for history).
- Handle song and folder names with spaces or special characters robustly.

## Example Bash Command
```bash
find /home/me/Music -type f \( -iname '*.mp3' -o -iname '*.flac' -o -iname '*.wav' \) -print0 | shuf -z -n 1 | xargs -0 -r vlc --qt-start-minimized --play-and-exit &
```

## Notes
- Requires VLC to be installed and available in PATH.
- This skill is intended for local desktop use, not remote/headless servers.
- Uses null-delimited filenames to safely handle spaces and special characters in both file and folder names.
