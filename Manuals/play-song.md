# play-song

`play-song` is a local desktop music-playback skill that launches VLC in minimized mode and plays a song from `/home/me/Music`.

## Purpose

Use it to:

- play a random song
- play multiple different songs by entering a number
- play a song by full or partial title
- match artist, album, or folder names when they appear in the path
- keep playback in the background without blocking the terminal

## Requirements

- VLC installed and available in `PATH`
- local desktop session
- music stored under `/home/me/Music`

This is not intended for headless or SSH-only sessions.

## Script

The helper script is:

```bash
/home/me/Notebooks/.github/skills/play-song/play-song.sh
```

## Usage

Play a random song:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh
```

Play three different random songs:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh 3
```

Play a matching song by name:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh "Endemoniada"
```

Play two different matching songs:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh 2 "Endemoniada"
```

Another example:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh "big sky"
```

Show help:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh --help
```

## How Matching Works

If no argument is given, the script picks one random supported audio file.

If the first argument is a number, the script plays that many different songs.

If a text argument is also given, the script:

- scans `/home/me/Music` recursively
- includes subdirectories and symlinked subdirectories
- matches case-insensitively against the full file path
- chooses the requested number of different matches at random

That means partial titles work.

Examples of partial matches:

- `"big"`
- `"sky"`
- `"endem"`
- `"Celtic Frost"`
- `"1990 - Vanity Nemesis"`

Because matching uses the full path, a query can match:

- song title
- artist folder
- album folder
- filename

## Supported Formats

The script currently searches for:

- `.mp3`
- `.flac`
- `.wav`

## Behavior

The script:

- uses `find -L` to follow symlinked subdirectories
- treats a leading number as the song count
- prints the selected song path or paths
- launches VLC with `--qt-start-minimized`
- plays the selected songs in one VLC invocation
- runs playback in the background with `nohup`

## Examples

Random:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh
```

Multiple random songs:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh 5
```

Partial title:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh "endem"
```

Multiple partial-title matches:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh 2 "big"
```

Artist or folder match:

```bash
bash /home/me/Notebooks/.github/skills/play-song/play-song.sh "Celtic Frost"
```

## Troubleshooting

If VLC is missing, the script exits with:

```text
vlc is not installed or not in PATH
```

If nothing matches your query, the script exits with:

```text
No songs matched: <query>
```

If the count is invalid, the script exits with:

```text
count must be at least 1
```

If the music folder is missing, the script exits with:

```text
Music library not found: /home/me/Music
```

## PiMan Integration

PiMan can use this workflow for local desktop music playback.

See also:

- `/home/me/Notebooks/.github/skills/play-song/SKILL.md`
- `/home/me/Notebooks/Manuals/PiMan_Quick_Start.md`
