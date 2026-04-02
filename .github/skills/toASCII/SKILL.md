---
name: toASCII
description: "Use when: creating ASCII art from a user-entered phrase or word. Renders large decorative text banners using figlet or toilet. Use for: generating ASCII art titles, banners, labels, or fun text displays."
argument-hint: "phrase to render as ASCII art"
---

# toASCII Skill

## Purpose
Render a user-supplied phrase as ASCII art text using `figlet` (preferred), `toilet` (fallback), or Python `pyfiglet` (last resort).

## When to Use
- User asks to "make ASCII art of ..."
- User asks to "create ASCII art of ..."
- User wants a text banner, title, or decorative large text
- User wants to see a phrase displayed in figlet/ASCII style

## Procedure

1. Run the helper script with the user's phrase:
   ```bash
   bash /home/me/Notebooks/.github/skills/toASCII/toascii.sh "USER PHRASE HERE"
   ```
2. The output is printed to stdout **and** appended to `/home/me/Notebooks/ascii-art.txt`.
3. Display the output directly in chat inside a fenced code block so spacing is preserved.

To save to a custom file instead:
   ```bash
   bash /home/me/Notebooks/.github/skills/toASCII/toascii.sh "USER PHRASE HERE" /path/to/output.txt
   ```

## Helper Script
Use [toascii.sh](./toascii.sh) for a self-contained invocation that handles all fallbacks automatically.

## Font Options (figlet)
- Default font: `figlet "phrase"`
- Bold/wider: `figlet -f big "phrase"`
- Smaller: `figlet -f small "phrase"`

## Notes
- Always wrap output in triple-backtick code block so spacing is preserved.
- If the phrase contains special shell characters (`$`, `` ` ``, `!`), use single quotes: `figlet 'phrase'`.
- The script exits with a non-zero code and an error message if none of the renderers are available.
