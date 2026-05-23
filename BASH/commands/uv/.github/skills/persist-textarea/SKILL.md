---
name: persist-textarea
description: "Use when: adding server-backed persistence to one or more <textarea> elements on an HTML page served by server.py. Requires only a data attribute on the textarea and a script tag — no JavaScript changes needed."
argument-hint: "page name and textarea IDs to persist"
---

# persist-textarea Skill

## Purpose
Give any `<textarea>` server-backed persistence: text is loaded on page open,
auto-saved as the user types (debounced 800 ms), and flushed via `sendBeacon`
when the tab closes or navigates away.

## Requirements
- `server.py` from the 0101 project (provides `/api/text/<key>` and `/api/ping`)
- `persist.js` copied or linked from `0101/0101/src/public_html/persist.js`

## How to Add Persistence to a Textarea

### Step 1 — Add `data-persist` attribute
Give each textarea a unique storage key via `data-persist`:

```html
<textarea id="my-notes" data-persist="my-notes-key" rows="4" cols="20"></textarea>
```

The key must match `^[a-z0-9][a-z0-9-]{0,63}$` (lowercase letters, digits, hyphens).
**Use descriptive keys** — they become filenames in `saved/<key>.txt`.

Convention used in 0101 pages: `<page>-control`, `<page>-structure`
e.g. `scout-control`, `navy-structure`, `army-control`

### Step 2 — Include persist.js
Place this at the bottom of `<body>` (after any textareas):

```html
<script src="persist.js"></script>
```

### That's it
Every `<textarea data-persist="...">` on the page is automatically:
- **Loaded** on `DOMContentLoaded` via `GET /api/text/<key>`
- **Saved** on `input` (debounced 800 ms) via `POST /api/text/<key>`
- **Flushed** on `pagehide` via `navigator.sendBeacon`

## Example — full minimal page

```html
<!DOCTYPE html>
<html>
  <head><meta charset="UTF-8"><title>My Page</title></head>
  <body>
    <h2>Notes</h2>
    <textarea id="notes" data-persist="mypage-notes" rows="6" cols="40"></textarea>

    <h2>Structure</h2>
    <textarea id="structure" data-persist="mypage-structure" rows="6" cols="40"></textarea>

    <script src="persist.js"></script>
  </body>
</html>
```

## Multiple textareas
All textareas with `data-persist` on the page are handled automatically — no
limit on count, no JS changes required.

## Saved files
Text is stored in `saved/<key>.txt` relative to `server.py`.
Keys are validated server-side; invalid keys return 404.

## Heartbeat / server shutdown
`persist.js` also pings `GET /api/ping` every 5 seconds to keep the server
watchdog alive. The server shuts down automatically 15 s after all browser
windows close.

## Storage key naming rules
- Lowercase letters, digits, hyphens only
- Must start with a letter or digit
- Max 64 characters
- Must be unique across all pages (keys are global, not per-page)
