# Traveller Map API Report

**Source:** https://travellermap.com/doc/api  
**Date:** 2026-03-25

---

## Overview

The Traveller Map site exposes a public REST API used internally by the browser client and available to external developers. APIs are free to use; donations appreciated at https://ko-fi.com/inexorabletash.

### Two URL Schemes

| Scheme | Pattern | Description |
|--------|---------|-------------|
| **Functional** | `/api/endpoint?params` | Function-first; takes parameters and options |
| **Semantic/Data** | `/data/sector/...` | Object-first; easier to remember and share |

Both schemes are supported indefinitely and expose identical functionality where they overlap.

---

## Common Concepts

### Rendering Options (`options=` parameter)

A decimal bitfield. Combine flag values by addition.

| Flag | Hex | Decimal | Description |
|------|-----|---------|-------------|
| SectorGrid | 0x0001 | 1 | Show sector grid |
| SubsectorGrid | 0x0002 | 2 | Show subsector grid |
| SectorsSelected | 0x0004 | 4 | Show only some sector names at low scales |
| SectorsAll | 0x0008 | 8 | Show all sector names |
| BordersMajor | 0x0010 | 16 | Show major region borders |
| BordersMinor | 0x0020 | 32 | Show minor region borders |
| NamesMajor | 0x0040 | 64 | Show major region names |
| NamesMinor | 0x0080 | 128 | Show minor region names |
| WorldsCapitals | 0x0100 | 256 | Show capitals |
| WorldsHomeworlds | 0x0200 | 512 | Show homeworlds |
| ForceHexes | 0x2000 | 8192 | Never render square hexes |
| WorldColors | 0x4000 | 16384 | Use Atm/Hyd world colors |
| FilledBorders | 0x8000 | 32768 | Background colors for bordered regions |

### Rendering Styles (`style=` parameter)

| Style | Description |
|-------|-------------|
| `poster` | Color-on-black; matches the classic "Spinward Marches" poster (default) |
| `print` | Color-on-white; best for color printing |
| `atlas` | Grayscale black-on-white; matches *Atlas of the Imperium* style |
| `candy` | Evokes sci-fi movie displays; shows world size and hydrographics |
| `draft` | Reminiscent of GDW's original hand-drawn draft |
| `fasa` | FASA supplement/magazine style |
| `terminal` | Retro-futuristic computer terminal style |
| `mongoose` | Mongoose Publishing house style |

### Additional Rendering Parameters (Page & API)

| Parameter | Description |
|-----------|-------------|
| `dimunofficial=1` | Dim sectors with unofficial data |
| `review=1` | Tint sectors by T5SS review status |
| `routes=0` | Don't render routes |
| `rifts=0` | Don't shade rifts |
| `sscoords=1` | Subsector-style hex numbering (0101–0810) |
| `allhexes=1` | Number all hexes (default: worlds only) |
| `nogrid=1` | Hide hex grid |
| `po=1` | Population overlay |
| `im=1` | Importance overlay |
| `dw=1` | Droyne World overlay |
| `an=1` | Ancient World overlay |
| `mh=1` | Minor Race Homeworld overlay |
| `stellar=1` | Show star representations instead of world details |
| `hw=FN[+/-]` | Highlight worlds by characteristic (e.g. `hw=T12+` = TL 12+) |

### API-Only Rendering Parameters

| Parameter | Description |
|-----------|-------------|
| `dpr=N` | Device pixel ratio (e.g. `dpr=2` for retina displays) |
| `datauri=1` | Return image as base64 Data URI |

---

## HTML APIs

### Main Page — Query Parameters

**Location:**

| Parameter | Description |
|-----------|-------------|
| `scale` | Pixels per parsec (default 64) |
| `sector` + `hex` | Named location |
| `sx`, `sy`, `hx`, `hy` | Sector/hex coordinates |
| `x`, `y` | World-space coordinates |
| `p=x!y!s` | Compact coordinates |
| `q=QUERY` | Search and show results |
| `qn=QUERY` | Search and navigate to first result |
| `hideui=1` | Hide the page UI |
| `galdir=0` | Hide galactic direction overlay |

**Markers:**

| Parameter | Description |
|-----------|-------------|
| `marker_url=URL` | Marker image URL |
| `marker_sector` + `marker_hex` | Named marker position |
| `marker_sx/sy/hx/hy` | Sector/hex marker position |
| `marker_x` + `marker_y` | World-space marker position |
| `marker=URL` | Shortcut: place marker at initial map location |
| `yah_sector/hex` | "You Are Here" marker (named) |
| `yah_sx/sy/hx/hy` | "You Are Here" (sector/hex) |
| `yah` | "You Are Here" shortcut |

Built-in marker images (256×256 PNG, centered on coordinates):
- `res/markers/beowulf.png` — Beowulf-class Free Trader
- `res/markers/scout.png` — Sulieman-class Scout/Courier
- `res/markers/fartrader.png` — Empress Marava-class Far Trader
- `res/markers/submerchant.png` — Akkigish-class Subsidized Merchant
- `res/markers/subliner.png` — Subsidized Liner
- `res/markers/merccruiser.png` — Mercenary Cruiser
- `res/markers/sdb.png` — System Defense Boat
- `res/markers/labship.png` — Laboratory Ship

**Overlays:**

| Parameter | Description |
|-----------|-------------|
| `ew=DATE` | Empress Wave overlay (e.g. `ew=1116`, `ew=132-1116`, `ew=milieu`) |
| `ox/oy/ow/oh` + `os` | Rectangle overlay in map-space coords |
| `or=x!y!w!h~x!y!w!h` | Compact rectangle overlays |
| `ocx/ocy/ocr` + `ocs` | Circle overlay |
| `oc=x!y!r~x!y!r` | Compact circle overlays |

### Go Links — Short URLs

```
https://travellermap.com/go/sector
https://travellermap.com/go/sector/hex
```
Example: https://travellermap.com/go/spin/1910

### IFRAME Embedding

```html
<iframe src="https://travellermap.com/go/spin/1910?style=print"
        style="width:600px; height:400px; border: ridge 10px gray;">
</iframe>
```

- UI is hidden by default in iframes; add `forceui=1` to show it
- User preferences are ignored (you control look/feel with parameters)
- Click/double-click events posted to parent page via `message` event:
  ```js
  { source: "travellermap", type: "click", location: { x: 19, y: 10 } }
  ```

---

## Data APIs

### Coordinates — Sector Lookup / Coordinate Conversion

```
GET /api/coordinates?sector=SECTOR[&hex=HEX][&subsector=SUB]
GET /api/coordinates?sx=SX&sy=SY[&hx=HX&hy=HY]
Data: /data/sector/coordinates
      /data/sector/hex/coordinates
```

**Returns:** `sx`, `sy`, `hx`, `hy` (sector/hex) and `x`, `y` (world-space)  
**Output:** JSON (default) or XML (`accept=text/xml`)  
**Example:** https://travellermap.com/api/coordinates?sector=Spinward%20Marches&hex=1910

---

### Credits — World/Source Data for a Location

```
GET /api/credits?sector=SECTOR[&hex=HEX]
GET /api/credits?sx=SX&sy=SY[&hx=HX&hy=HY]
GET /api/credits?x=X&y=Y
Data: /data/sector/credits
      /data/sector/hex/credits
```

**Example:** https://travellermap.com/api/credits?x=-110&y=-70

---

### SEC — UWP Data for a Sector

```
GET  /api/sec?sector=SECTOR[&subsector=SUB][&quadrant=QUAD]
GET  /api/sec?sx=SX&sy=SY
POST /api/sec  (body = sector data; auto-detects SEC/T5/T5Tab format)
Data: /data/sector
      /data/sector/sec | /tab
      /data/sector/subsector/sec | /tab
      /data/sector/quadrant/sec | /tab
```

**Output format options (`type=`):**

| Type | Description |
|------|-------------|
| `SecondSurvey` | T5SS human-readable (default for `/data/`) |
| `TabDelimited` | T5SS tab-delimited; recommended for scripting |
| `Legacy` | Legacy SEC format (default for `/api/`) |

**Additional options:** `metadata=0`, `header=0`, `sscoords=1`, `lint=1`  
**Example:** https://travellermap.com/api/sec?sector=Spinward%20Marches&type=SecondSurvey

---

### Metadata — Sector Metadata

```
GET  /api/metadata?sector=SECTOR
GET  /api/metadata?sx=SX&sy=SY
POST /api/metadata  (body = XML or MSEC metadata)
Data: /data/sector/metadata
```

**Output:** JSON (default) or XML  
**Example:** https://travellermap.com/api/metadata?sector=Spinward%20Marches

---

### MSEC — sec2pdf Metadata

```
GET /api/msec?sector=SECTOR
GET /api/msec?sx=SX&sy=SY
Data: /data/sector/msec
```

**Example:** https://travellermap.com/api/msec?sector=Spinward%20Marches

---

### Jump Worlds — Worlds Within N Parsecs

```
GET /api/jumpworlds?sector=SECTOR&hex=HEX[&jump=N]
GET /api/jumpworlds?x=X&y=Y[&jump=N]
GET /api/jumpworlds?sx=SX&sy=SY&hx=HX&hy=HY[&jump=N]
Data: /data/sector/hex               (jump=0, single world)
      /data/sector/hex/jump/N
```

**Parameters:** `jump` = 0–12 (default 6), `milieu`  
**Returns fields per world:** `Name`, `Hex`, `UWP`, `Bases`, `Remarks`, `Zone`, `PBG`, `Allegiance`, `Stellar`, `Ix`, `Ex`, `Cx`, `Nobility`, `Worlds`  
**Example:** https://travellermap.com/api/jumpworlds?sector=Spinward%20Marches&hex=1910&jump=4

---

### Search — Find Worlds or Regions

```
GET /api/search?q=QUERY[&milieu=M1105]
```

**Query syntax:**

| Modifier | Example | Meaning |
|----------|---------|---------|
| (default) | `Regina` | Starts-of-word match |
| `exact:` | `exact:sol` | Exact match only |
| `like:` | `like:tear` | Sounds-like match |
| `uwp:` | `uwp:A*` | Match on UWP field |
| `pbg:`, `zone:`, `alleg:` | `alleg:Im` | Match PBG/Zone/Allegiance |
| `stellar:` | `stellar:"M? I*"` | Match star type |
| `remark:` | `remark:Hi` | Require specific remark |
| `in:` | `t* in:spin` | Filter by sector name |
| `*`, `%` | `r*a` | Zero-or-more wildcard |
| `?`, `_` | `Re?ina` | Single-character wildcard |
| `[range]` | `[0-5]` | Character range |

**Example:** https://travellermap.com/api/search?q=Regina

---

### Route — Jump Routes Between Worlds

```
GET /api/route?start=LOC&end=LOC[&jump=N]
```

**Parameters:** `start` + `end` (e.g. `SPIN 1910`), `jump` 0–12 (default 2)  
**Filters:** `wild=1` (wilderness refueling only), `im=1` (Imperium worlds only), `nored=1` (no Red Zones), `aok=1` (anomalies/calibration points allowed)  
**Returns:** Shortest path as JSON or XML. `404` if no route found.  
**Example:** https://travellermap.com/api/route?start=spin+1910&end=spin+2110&jump=1

---

### Universe — List All Sectors

```
GET /api/universe[?milieu=M1105][&requireData=1][&tag=Official]
Data: /data
```

**Tag filter examples:** `Official`, `InReview`, `Preserve`, `Official|InReview`  
**Example:** https://travellermap.com/api/universe?milieu=M1105

---

### Milieux — List All Milieux

```
GET /api/milieux
```

Returns list of milieu codes (e.g. `M1105`, `IW`) with `IsDefault` flag.  
**Example:** https://travellermap.com/api/milieux

---

### T5SS — Stock Data

```
GET /t5ss/allegiances   → T5SS allegiance codes (Code + Name)
GET /t5ss/sophonts      → T5SS sophont codes (Code + Name)
```

---

## Rendering APIs

### Tile — Arbitrary Rectangle of Space

```
GET /api/tile?x=X&y=Y&scale=N[&options=...&style=...&w=256&h=256]
```

Uses **tile-space coordinates** (see Appendix). Output: PNG (or JPEG for `candy` style).  
**Example:** https://travellermap.com/api/tile?x=-24.5&y=-18&scale=64&options=887&style=poster

---

### Poster — Render Sector / Quadrant / Subsector

```
GET  /api/poster?sector=SECTOR[&subsector=SUB][&quadrant=QUAD]
GET  /api/poster?x1=X1&y1=Y1&x2=X2&y2=Y2   (arbitrary rectangle)
POST /api/poster  (body = sector data + optional metadata)
Data: /data/sector/image
      /data/sector/subsector/image
      /data/sector/quadrant/image
```

**POST content types:** `application/x-www-form-urlencoded`, `multipart/form-data`, `text/plain`  
**Options:** `scale`, `rotation` (1/2/3), `hrotation` (degrees), `clampar=1`, `options`, `style`, `thumb=1`, `compositing=1`  
**Output:** PNG by default; `accept=application/pdf` or `accept=image/svg+xml` for other formats  
**UI helper:** https://travellermap.com/poster  

**Example:**
```
https://travellermap.com/api/poster?sector=spin&subsector=C&style=atlas&scale=48
```

---

### Jump Map — Render Hexes Within N Parsecs

```
GET  /api/jumpmap?sector=SECTOR&hex=HEX&jump=N
GET  /api/jumpmap?sx=SX&sy=SY&hx=HX&hy=HY&jump=N
GET  /api/jumpmap?x=X&y=Y&jump=N
POST /api/jumpmap  (body = sector data)
Data: /data/sector/hex/jump/N/image
```

**Parameters:** `jump` 0–20 GET (1–12 POST), `scale`, `options`, `style`, `clip=0`, `border=0`, `hrotation`  
**Output:** Indexed 8-bit PNG (transparent outside hex borders) or PDF/SVG  
**Example:**
```
https://travellermap.com/api/jumpmap?sector=spin&hex=1910&jump=4&scale=48&style=atlas
```

---

## Semantic URL Namespace (Summary)

| Resource | URL Pattern |
|----------|------------|
| All sectors | `/data` |
| Sector data (T5SS) | `/data/sector` |
| Sector (tab-delimited) | `/data/sector/tab` |
| Sector (legacy SEC) | `/data/sector/sec` |
| Sector metadata (XML) | `/data/sector/metadata` |
| Sector map image | `/data/sector/image` |
| Sector coordinates | `/data/sector/coordinates` |
| Sector credits | `/data/sector/credits` |
| Quadrant data | `/data/sector/quadrant[/tab\|/sec\|/image]` |
| Subsector data | `/data/sector/subsector[/tab\|/sec\|/image]` |
| World data | `/data/sector/hex` |
| World coordinates | `/data/sector/hex/coordinates` |
| World credits | `/data/sector/hex/credits` |
| Worlds in jump range | `/data/sector/hex/jump/N` |
| Jump map image | `/data/sector/hex/jump/N/image` |
| World sheet | `/data/sector/hex/sheet` |

---

## Appendix: Coordinate Systems

| System | Used By | Notes |
|--------|---------|-------|
| **Named** | Coordinates, JumpMap, Credits, IFRAME, Main page | `sector` + `hex` params; case-insensitive; T5SS 4-letter abbrevs supported |
| **Sector/Hex** | Coordinates, JumpMap, Credits | `sx`,`sy`,`hx`,`hy`; Core=(0,0); +X=Trailing, +Y=Rimward |
| **World-Space** | Credits, JumpMap, Coordinates | `x`,`y`; Reference (Core 0140) = (0,0) |
| **Map-Space** | Main page, IFRAME | `x`,`y`; Y-axis inverted; accounts for hex packing geometry |
| **Tile-Space** | Tile API | `x`,`y`; image-space coords optimized for tile rendering |

**Key examples (Regina, Spinward Marches 1910):**

| System | Value |
|--------|-------|
| Named | `"Spinward Marches"` / `"1910"` |
| Sector/Hex | `sx=-4, sy=-1, hx=19, hy=10` |
| World-Space | `x=-110, y=-70` |
| Map-Space | `x=-95.914, y=70.5` |

### World-Space ↔ Sector/Hex Conversion (JavaScript)

```js
const SECTOR_WIDTH = 32, SECTOR_HEIGHT = 40;
const REFERENCE_HEX_X = 1, REFERENCE_HEX_Y = 40;  // Core 0140

function sectorHexToWorldXY(sx, sy, hx, hy) {
  return {
    x: sx * SECTOR_WIDTH  + (hx - REFERENCE_HEX_X),
    y: sy * SECTOR_HEIGHT + (hy - REFERENCE_HEX_Y)
  };
}
```

---

## CORS & JSONP

All APIs output **CORS headers** — modern browsers can call them directly via `fetch()` or `XMLHttpRequest`.

APIs supporting **JSONP** (append `&jsonp=callbackFn`):
- Coordinates, Credits, Jump Worlds, Search, Universe, Metadata, SEC, MSEC

---

## Milieu Codes (examples)

| Code | Milieu |
|------|--------|
| `M1105` | Classic Traveller era (1105 Imperial) |
| `M1900` | Far future |
| `IW` | Interstellar Wars |

---

## Useful Quick-Reference URLs

| Purpose | URL |
|---------|-----|
| Sector list | https://travellermap.com/data |
| Spinward Marches data | https://travellermap.com/data/Spinward%20Marches |
| Spinward Marches image | https://travellermap.com/data/Spinward%20Marches/image |
| Regina world data | https://travellermap.com/data/Spinward%20Marches/1910 |
| Regina jump-4 worlds | https://travellermap.com/api/jumpworlds?sector=Spinward%20Marches&hex=1910&jump=4 |
| Search for "Regina" | https://travellermap.com/api/search?q=Regina |
| Map embed (Regina) | https://travellermap.com/go/spin/1910 |
| All milieux | https://travellermap.com/api/milieux |
| Allegiance codes | https://travellermap.com/t5ss/allegiances |
| Sophont codes | https://travellermap.com/t5ss/sophonts |

---

*The Traveller game in all forms is owned by Mongoose Publishing. Copyright 1977–2024 Mongoose Publishing.*  
*API source: https://travellermap.com/doc/api — open source at https://github.com/inexorabletash/travellermap*
