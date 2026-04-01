#!/usr/bin/env bash

set -euo pipefail

music_root="/home/me/Music"
count=1

if [[ "${1:-}" =~ ^[0-9]+$ ]]; then
	count="$1"
	shift
fi

query="${*:-}"

usage() {
	cat <<'EOF'
Usage:
  play-song.sh [count] [song name]

Examples:
  play-song.sh
  play-song.sh 3
  play-song.sh Africa
  play-song.sh 2 Africa
  play-song.sh "Brothers In Arms"

Behavior:
  - With no argument, plays one random song from /home/me/Music.
  - If the first argument is a number, plays that many different songs.
  - If a song name is also provided, selects that many different matching songs.
  - Scans /home/me/Music recursively, including subdirectories and symlinked subdirectories.
  - VLC starts minimized and playback is launched in the background.
EOF
}

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
	usage
	exit 0
fi

if [[ "$count" -lt 1 ]]; then
	echo "count must be at least 1" >&2
	exit 1
fi

if ! command -v vlc >/dev/null 2>&1; then
	echo "vlc is not installed or not in PATH" >&2
	exit 1
fi

if [[ ! -d "$music_root" ]]; then
	echo "Music library not found: $music_root" >&2
	exit 1
fi

matches=()
while IFS= read -r -d '' file; do
	if [[ -z "$query" || "${file,,}" == *"${query,,}"* ]]; then
		matches+=("$file")
	fi
done < <(find -L "$music_root" -type f \( -iname '*.mp3' -o -iname '*.flac' -o -iname '*.wav' \) -print0)

if [[ ${#matches[@]} -eq 0 ]]; then
	if [[ -n "$query" ]]; then
		echo "No songs matched: $query" >&2
	else
		echo "No supported audio files found under $music_root" >&2
	fi
	exit 1
fi

if [[ "$count" -gt ${#matches[@]} ]]; then
	echo "Requested $count songs, but only ${#matches[@]} matched. Playing all matches."
	count=${#matches[@]}
fi

selected_files=()
while IFS= read -r -d '' file; do
	selected_files+=("$file")
done < <(printf '%s\0' "${matches[@]}" | shuf -z -n "$count")

if [[ ${#selected_files[@]} -eq 0 ]]; then
	echo "Failed to select song(s)" >&2
	exit 1
fi

if [[ ${#selected_files[@]} -eq 1 ]]; then
	echo "Playing: ${selected_files[0]}"
else
	echo "Playing ${#selected_files[@]} songs:"
	for file in "${selected_files[@]}"; do
		echo "- $file"
	done
fi

nohup vlc --qt-start-minimized --play-and-exit "${selected_files[@]}" >/dev/null 2>&1 &
