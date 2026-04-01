# Questions and Answers

## 1. Where was backup saved?

**Question:** Where was backup saved?

**Answer:**  
It was saved to `/media/me/SSD120/Notebook-20260401.zip`.

This came from the backup script, which sets:

- `DEST="/media/me/SSD120/Notebook-$DATE.zip"`
- `DATE=$(date +%Y%m%d)`

So on 1 April 2026, the output path becomes:

`/media/me/SSD120/Notebook-20260401.zip`

---

## 2. What are YAML files?

**Question:** What are YAML files?

**Answer:**  
YAML files are plain text configuration files used to represent structured data.

`YAML` originally meant "Yet Another Markup Language", but it is now commonly explained as "YAML Ain't Markup Language" because it is mainly used for configuration and data, not document markup.

YAML is popular because it is easier for humans to read than JSON. It represents things like:

- keys and values
- lists
- nested objects

It mainly uses indentation instead of braces and commas.

Example:

```yaml
tools:
  - name: "pdf-merge"
    command: "python merge_pdfs.py"
    version: "1.0"
  - name: "skill-lister"
    command: "python lister.py"
    version: "2.1"
```

This means:

- `tools` is a list
- each `-` starts a list item
- each item has fields such as `name`, `command`, and `version`

Practical YAML rules:

- indentation matters, usually 2 spaces
- `key: value` defines a field
- `-` defines a list item
- strings may be quoted or unquoted
- comments start with `#`

Typical YAML filenames use `.yml` or `.yaml`.

---

## 3. How are full-stops used in filenames, not counting the final extension?

**Question:** Tell me about how full-stops are used in filenames, not the last one, such as not `.md`.

**Answer:**  
Full-stops inside a filename, before the final extension, are usually just ordinary characters. The operating system usually does not give them special meaning by itself. People and tools use them as separators by convention.

Example:

`project.notes.v2.md`

Here:

- `project.notes.v2` is the main filename
- `.md` is the final extension
- the earlier `.` characters are just part of the name

Common uses for earlier full-stops:

- separating words or sections: `meeting.notes.april.md`
- showing versions: `report.v2.final.md`
- showing dates or categories: `backup.2026.04.01.zip`
- indicating compound formats: `archive.tar.gz`

### Important exception: compound extensions

Sometimes the earlier full-stop is part of a known multi-part suffix.

Examples:

- `archive.tar.gz`
- `data.csv.gz`
- `package.min.js`

In `archive.tar.gz`:

- `.gz` is the final extension
- `.tar` is also meaningful
- the file is a tar archive compressed with gzip

Practical points:

- Linux allows multiple `.` characters freely
- many programs decide file type from the last extension
- some tools recognize common multi-part endings like `.tar.gz`
- too many dots can make filenames harder to read
- a leading dot is different, because it usually makes a file hidden on Linux

Examples:

- `notes.chapter1.draft.md`: earlier dots are separators
- `photo.backup.jpg`: earlier dot is just part of the name
- `archive.tar.gz`: earlier dot is part of a recognized compound extension

---

## 4. How are roles utilised?

**Question:** How are roles utilised?

**Answer:**  
In this repository, roles are used in three main ways:

- **Agent persona/orchestration roles:** In the CREW agent system, each agent has an explicit `role` field that defines authority, scope, and delegation behavior (for example Captain, Navigator, Doctor).
- **Chat/API message roles:** In AI skill examples, roles are protocol fields in message payloads, mainly `user` and `assistant`, and they must alternate correctly.
- **Domain data roles:** In app/game data, `ROLE` is also a business field describing a crew member's function.

Examples in the repository:

- `AI/agents/CREW/description.md`
- `AI/agents/CREW/Captain/Captain.agent.md`
- `AI/skills/skills-main/skills/claude-api/python/claude-api/tool-use.md`
- `AI/skills/skills-main/skills/claude-api/shared/error-codes.md`
- `CREW/Crew/mcp_service.py`
- `VTT/traveller-foundryvtt-0.18.9/README.md`
- `.env`: leading dot makes it hidden; it may not have a normal extension

A useful rule:

- the last dot usually introduces the main extension
- earlier dots are usually just separators, unless a known multi-part suffix is recognized

---

## 5. How do extra full-stops affect sorting, file associations, shell commands, and glob patterns?

**Question:** Please explain how extra full-stops affect sorting, file associations, shell commands, and glob patterns.

**Answer:**

### Sorting

Most shells and file managers sort the whole filename as text.

Examples:

1. `report.a.txt`
2. `report.b.txt`
3. `report.final.txt`
4. `report.v2.txt`
5. `report.v10.txt`

Important point:

Text sorting is not the same as numeric sorting, so `v10` may appear before `v2` unless the tool uses natural sort.

Examples:

- plain text sort: `file.10.txt` may come before `file.2.txt`
- natural sort: `file.2.txt` comes before `file.10.txt`

If you want stable ordering, use zero padding:

- `file.01.txt`
- `file.02.txt`
- `file.10.txt`

### File associations

Most systems decide which program opens a file from the last extension.

Examples:

- `notes.project.final.md` opens as Markdown because of `.md`
- `photo.backup.jpg` opens as an image because of `.jpg`
- `budget.2026.xlsx` opens as a spreadsheet because of `.xlsx`

Some known multi-part endings may be understood specially:

- `archive.tar.gz`
- `package.tar.bz2`
- `data.csv.gz`

In those cases, tools may understand both parts:

- `.tar` means archive format
- `.gz` means gzip compression

So the last extension is the main rule, but some combined suffixes are treated as a unit.

### Shell commands

Commands like `mv`, `cp`, and `rm` treat the filename as a string.

Examples:

```bash
mv report.v1.txt report.v2.txt
cp backup.2026.04.01.zip old/
rm notes.final.draft.md
```

Extra dots do not usually change command behavior.

The main exception is a leading dot:

- `.env`
- `.bashrc`
- `.gitignore`

A leading dot usually makes the file hidden on Linux.

### Glob patterns

Extra dots matter when matching filenames.

Examples:

- `*.md` matches anything ending in `.md`
- `report.*` matches `report.v1`, `report.txt`, `report.final.md`
- `*.tar.gz` matches files ending exactly with `.tar.gz`
- `*.*` matches filenames containing at least one dot

Examples:

- `notes.v1.md` matches `*.md`
- `notes.v1.md` also matches `notes.*`
- `archive.tar.gz` matches `*.gz`
- `archive.tar.gz` also matches `*.tar.gz`

### Common pitfalls

- too many dots can make version names messy: `report.final.v2.realfinal.txt`
- some scripts incorrectly split filenames only on the last dot
- filenames like `data.backup.csv.gz` can be confusing unless the naming convention is clear

### Good practice

Use extra full-stops when they add clear meaning:

- `project.v2.docx`
- `backup.2026-04-01.zip`
- `archive.tar.gz`

Avoid cluttered names such as:

- `draft.final.new.final2.txt`

A practical rule:

Use the last extension for file type, and use earlier dots only as simple separators for version, date, category, or known compound formats.

---

## 6. What are known compound formats?

**Question:** What are known compound formats?

**Answer:**  
Known compound formats are filenames where more than one suffix is meaningful, not just the last one.

Instead of reading only the final extension, tools or people recognize the filename ending as a combined pattern.

Examples:

- `archive.tar.gz`
- `archive.tar.bz2`
- `archive.tar.xz`
- `data.csv.gz`
- `log.txt.gz`
- `bundle.min.js`
- `styles.module.css`
- `component.test.js`
- `component.spec.ts`
- `app.d.ts`

What that means in practice:

- `archive.tar.gz`
  - `.tar` says it is an archive containing multiple files
  - `.gz` says that archive is compressed with gzip

- `data.csv.gz`
  - `.csv` says the original content is comma-separated text
  - `.gz` says the file is compressed

- `bundle.min.js`
  - `.js` is the executable JavaScript file type
  - `.min` conventionally means minified

- `component.test.js`
  - `.js` is the file type
  - `.test` conventionally says this is a test file

So compound format can mean two slightly different things:

1. True stacked file formats
- One format wrapped inside another
- Examples: `tar.gz`, `tar.xz`, `csv.gz`

2. Naming conventions recognized by tools
- Not a different file container format, but a meaningful naming pattern
- Examples: `test.js`, `spec.ts`, `module.css`, `min.js`, `d.ts`

A useful distinction:

- `photo.backup.jpg`
  - `backup` is probably just a naming separator
  - usually not a recognized compound format

- `archive.tar.gz`
  - definitely a recognized compound format

Common recognized compound endings:

Archives and compression:

- `.tar.gz`
- `.tar.bz2`
- `.tar.xz`
- `.tar.zst`
- `.tgz`
- `.tbz2`

Compressed data/text:

- `.csv.gz`
- `.json.gz`
- `.xml.gz`
- `.txt.gz`
- `.log.gz`

Programming/tooling conventions:

- `.min.js`
- `.min.css`
- `.module.css`
- `.test.js`
- `.spec.js`
- `.test.ts`
- `.spec.ts`
- `.d.ts`

Why this matters:

- some tools know how to open or process them correctly
- some scripts should preserve the whole compound suffix, not just the last part
- renaming can break meaning if you remove one part

Example:

- changing `archive.tar.gz` to `archive.gz` loses the signal that it is a tar archive
- changing `app.d.ts` to `app.ts` changes the meaning completely in TypeScript

A simple rule:

If multiple suffix parts are widely recognized by tools or conventions, it is a known compound format. If the earlier dot just separates your own words, it is usually just part of the filename.

### Simple examples

Real compound file formats:

- `archive.tar.gz`
  - tar archive, then gzip compression
- `archive.tar.xz`
  - tar archive, then xz compression
- `data.csv.gz`
  - CSV file, then gzip compression
- `report.json.gz`
  - JSON file, then gzip compression
- `server.log.gz`
  - log file, then gzip compression

Programming filename conventions:

- `app.min.js`
  - JavaScript file, minified
- `styles.min.css`
  - CSS file, minified
- `button.test.js`
  - JavaScript test file
- `math.spec.ts`
  - TypeScript spec or test file
- `app.d.ts`
  - TypeScript declaration file
- `layout.module.css`
  - CSS module file

Looks compound, but usually is just naming:

- `photo.backup.jpg`
- `notes.final.docx`
- `budget.2026.xlsx`
- `meeting.april.notes.md`
- `draft.v2.txt`

Easy comparison:

- `archive.tar.gz`
  - compound format
- `photo.backup.jpg`
  - usually not a compound format
- `button.test.js`
  - recognized naming convention
- `notes.final.md`
  - usually just a filename with separators

A few extra very simple examples:

- `file.txt`
  - plain text file
- `file.txt.gz`
  - text file compressed with gzip
- `backup.tar`
  - tar archive
- `backup.tar.gz`
  - tar archive compressed with gzip
- `code.test.py`
  - probably a Python test file by naming convention
- `image.old.png`
  - probably just an image file with `old` as a label
