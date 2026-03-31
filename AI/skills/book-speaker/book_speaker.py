#!/usr/bin/env python3
"""
book_speaker.py — Read aloud the text of a .txt file using TTS.

Usage:
    python book_speaker.py /path/to/book.txt [--start-page N] [--end-page M] [--voice VOICE]

Dependencies:
    pip install pyttsx3

Options:
    --start-page N   Start reading from this page (default: 1)
    --end-page M     Stop reading at this page (default: last)
    --voice VOICE    Voice id or gender (optional)
"""

# book_speaker.py — Enhanced TTS book reader with advanced features
import argparse
import os
import sys
import pyttsx3
try:
    from gtts import gTTS
except ImportError:
    gTTS = None
import json

PAGE_MARKER = "--- Page "
CHAPTER_MARKER = "Chapter "
BOOKMARK_FILE = ".book_speaker_bookmark.json"

def parse_pages(lines, by_chapter=False):
    """Split text into pages or chapters."""
    marker = CHAPTER_MARKER if by_chapter else PAGE_MARKER
    sections = []
    current = []
    for line in lines:
        if line.strip().startswith(marker):
            if current:
                sections.append("".join(current))
                current = []
        current.append(line)
    if current:
        sections.append("".join(current))
    return sections

def list_voices(engine):
    voices = engine.getProperty('voices')
    print("Available voices:")
    for v in voices:
        print(f"- id: {v.id}, name: {v.name}, gender: {getattr(v, 'gender', 'unknown')}")

def save_bookmark(book, page):
    try:
        with open(BOOKMARK_FILE, "w") as f:
            json.dump({"file": book, "page": page}, f)
    except Exception as e:
        print(f"[Bookmark error] {e}", file=sys.stderr)

def load_bookmark(book):
    try:
        with open(BOOKMARK_FILE, "r") as f:
            data = json.load(f)
        if data.get("file") == book:
            return data.get("page", 1)
    except Exception:
        pass
    return 1

def export_mp3(text, out_file, lang="en"):
    if gTTS is None:
        print("gTTS not installed. Cannot export to MP3.", file=sys.stderr)
        return
    try:
        tts = gTTS(text, lang=lang)
        tts.save(out_file)
        print(f"Exported to {out_file}")
    except Exception as e:
        print(f"[MP3 export error] {e}", file=sys.stderr)

def interactive_mode(engine, pages, start, end, book):
    print("Interactive mode: [n]ext, [p]revious, [b]ookmark, [q]uit")
    i = start - 1
    total = len(pages)
    while i < end:
        print(f"\n[Page {i+1}/{total}]", file=sys.stderr)
        text = pages[i].strip()
        if not text:
            print("(Page is empty)", file=sys.stderr)
        else:
            engine.say(text)
            engine.runAndWait()
        cmd = input("Command: ").strip().lower()
        if cmd == "n":
            i += 1
        elif cmd == "p" and i > 0:
            i -= 1
        elif cmd == "b":
            save_bookmark(book, i+1)
            print(f"Bookmarked page {i+1}")
        elif cmd == "q":
            break
        else:
            print("Commands: n (next), p (prev), b (bookmark), q (quit)")

def main():
    parser = argparse.ArgumentParser(description="Read aloud a .txt book using TTS.")
    parser.add_argument("file", nargs="?", help="Path to .txt file")
    parser.add_argument("--start-page", type=int, default=None, help="Start page (default: 1 or bookmark)")
    parser.add_argument("--end-page", type=int, default=None, help="End page (default: last)")
    parser.add_argument("--voice", type=str, default=None, help="Voice id or gender (optional)")
    parser.add_argument("--rate", type=int, default=None, help="Speech rate (words per minute)")
    parser.add_argument("--female-slow", action="store_true", help="Use a slower female voice for output")
    parser.add_argument("--list-voices", action="store_true", help="List available voices and exit")
    parser.add_argument("--export-mp3", type=str, help="Export selected pages to MP3 (requires gTTS)")
    parser.add_argument("--by-chapter", action="store_true", help="Read by chapter/section markers instead of pages")
    parser.add_argument("--bookmark", action="store_true", help="Resume from last bookmark (if any)")
    parser.add_argument("--interactive", action="store_true", help="Interactive mode: control playback in real time")
    parser.add_argument("--gui", action="store_true", help="(Stub) Launch GUI (not implemented)")
    args = parser.parse_args()

    engine = pyttsx3.init()
    if args.list_voices:
        list_voices(engine)
        sys.exit(0)

    if args.gui:
        print("GUI mode is not implemented yet.")
        sys.exit(0)

    if not args.file or not os.path.isfile(args.file):
        print(f"File not found: {args.file}", file=sys.stderr)
        sys.exit(1)

    with open(args.file, "r", encoding="utf-8") as f:
        lines = f.readlines()
    pages = parse_pages(lines, by_chapter=args.by_chapter)
    total_pages = len(pages)

    # Bookmark support
    if args.bookmark:
        start = load_bookmark(args.file)
    else:
        start = args.start_page if args.start_page else 1
    end = args.end_page if args.end_page else total_pages
    if start > end or start < 1 or end > total_pages:
        print(f"Invalid page range: {start}-{end} (book has {total_pages} pages)", file=sys.stderr)
        sys.exit(1)


    # Voice selection and rate
    if args.female_slow:
        # Try to select a female voice and set a slower rate
        voices = engine.getProperty('voices')
        selected = None
        for v in voices:
            # pyttsx3 voice objects may have 'gender' or gender in name/id
            gender = getattr(v, 'gender', '').lower() if hasattr(v, 'gender') else ''
            if 'female' in gender or 'female' in v.name.lower() or 'female' in v.id.lower():
                selected = v
                break
        if selected:
            engine.setProperty('voice', selected.id)
        # Set a slower rate (default is usually 200)
        engine.setProperty('rate', 130)
    else:
        if args.voice:
            voices = engine.getProperty('voices')
            for v in voices:
                if args.voice.lower() in v.id.lower() or args.voice.lower() in v.name.lower():
                    engine.setProperty('voice', v.id)
                    break
        if args.rate:
            engine.setProperty('rate', args.rate)

    # Export to MP3
    if args.export_mp3:
        text = "\n".join(pages[start-1:end])
        export_mp3(text, args.export_mp3)
        sys.exit(0)

    # Interactive mode
    if args.interactive:
        interactive_mode(engine, pages, start, end, args.file)
        sys.exit(0)

    print(f"Reading pages {start} to {end} of {args.file}...", file=sys.stderr)
    for i in range(start-1, end):
        print(f"\n[Page {i+1}/{total_pages}]", file=sys.stderr)
        text = pages[i].strip()
        if not text:
            print("(Page is empty)", file=sys.stderr)
            continue
        try:
            engine.say(text)
            engine.runAndWait()
        except Exception as e:
            print(f"[TTS error] {e}", file=sys.stderr)
        # Save bookmark after each page
        save_bookmark(args.file, i+1)
    print("Done.", file=sys.stderr)

if __name__ == "__main__":
    main()
