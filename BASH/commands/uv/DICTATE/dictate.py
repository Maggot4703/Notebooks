#!/usr/bin/env python3
"""
DICTATE — Snazzy voice-to-text dictaphone
Records from microphone and transcribes to screen.
"""

import math
import os
import subprocess
import sys
import threading
import time
import tkinter as tk
from tkinter import scrolledtext


def _auto_install(module: str, package: str = None):
    """Try to install a module via pip. Returns True if successful."""
    try:
        import importlib

        importlib.import_module(module)
        return True
    except ImportError:
        pass
    if getattr(sys, "frozen", False):
        return False  # Don't try to pip install in a frozen app
    try:
        pkg = str(package) if package is not None else module
        # Detect if in a virtualenv
        in_venv = hasattr(sys, "real_prefix") or (
            hasattr(sys, "base_prefix") and sys.base_prefix != sys.prefix
        )
        pip_args = [sys.executable, "-m", "pip", "install"]
        if not in_venv:
            pip_args.append("--user")
        pip_args.append(pkg)
        subprocess.check_call(pip_args)
        import importlib

        importlib.invalidate_caches()
        importlib.import_module(module)
        return True
    except Exception:
        return False


# Try to import and auto-install dependencies
SR_AVAILABLE = False
try:
    import speech_recognition as sr

    SR_AVAILABLE = True
except ImportError:
    if _auto_install("speech_recognition", "SpeechRecognition"):
        import speech_recognition as sr

        SR_AVAILABLE = True
    else:
        sr = None  # type: ignore
        SR_AVAILABLE = False
# pyaudio is required for microphone input
PYAUDIO_AVAILABLE = False
try:
    import pyaudio  # noqa: F401

    PYAUDIO_AVAILABLE = True
except ImportError:
    if _auto_install("pyaudio"):
        import pyaudio  # noqa: F401

        PYAUDIO_AVAILABLE = True
    else:
        PYAUDIO_AVAILABLE = False


# ─────────────────────────────────────────────────────────────────────────────


class DictaphoneApp:

    COLORS = {
        "bg": "#0d1117",
        "panel": "#161b22",
        "border": "#30363d",
        "text": "#e6edf3",
        "dim": "#8b949e",
        "accent": "#58a6ff",
        "green": "#3fb950",
        "red": "#f85149",
        "button": "#21262d",
        "yellow": "#d29922",
    }

    # ── init ─────────────────────────────────────────────────────────────────

    def __init__(self, root: tk.Tk):
        self.root = root
        self.root.title("DICTATE")
        self.root.geometry("860x660")
        self.root.configure(bg=self.COLORS["bg"])
        self.root.resizable(True, True)
        self.root.minsize(620, 500)

        self.is_recording = False
        self._after_id = None
        self._wave_bars: list = []
        self._rec_thread: threading.Thread | None = None

        # Always define these attributes to avoid attribute errors
        self.recognizer = None
        self.microphone = None

        if SR_AVAILABLE and sr is not None and PYAUDIO_AVAILABLE:
            self.recognizer = sr.Recognizer()
            self.recognizer.dynamic_energy_threshold = True
            with open(os.devnull, "w") as devnull:
                old_stderr, sys.stderr = sys.stderr, devnull
                try:
                    self.microphone = sr.Microphone()
                finally:
                    sys.stderr = old_stderr

        self._build_ui()

        if SR_AVAILABLE and sr is not None and PYAUDIO_AVAILABLE:
            self._calibrate()
        else:
            missing = []
            if not SR_AVAILABLE:
                missing.append("speechrecognition")
            if not PYAUDIO_AVAILABLE:
                missing.append("pyaudio")
            self._set_status(
                f"⚠  Missing: {', '.join(missing)}. "
                "Tried auto-install. If still missing, run: "
                "pip install speechrecognition pyaudio",
                "red",
            )

    # ── UI construction ──────────────────────────────────────────────────────

    def _build_ui(self):
        C = self.COLORS

        # ── Header bar ────────────────────────────────────────
        hdr = tk.Frame(self.root, bg=C["bg"])
        hdr.pack(fill="x", padx=24, pady=(20, 0))

        tk.Label(
            hdr,
            text="◉  DICTATE",
            font=("Courier New", 28, "bold"),
            fg=C["accent"],
            bg=C["bg"],
        ).pack(side="left")

        self._status_lbl = tk.Label(
            hdr, text="Initialising…", font=("Courier New", 10), fg=C["dim"], bg=C["bg"]
        )
        self._status_lbl.pack(side="right", padx=2)

        # ── Thin separator ────────────────────────────────────
        tk.Frame(self.root, bg=C["border"], height=1).pack(
            fill="x", padx=24, pady=(10, 6)
        )

        # ── Canvas: mic button + flanking waveform ────────────
        self._canvas = tk.Canvas(
            self.root, width=500, height=120, bg=C["bg"], highlightthickness=0
        )
        self._canvas.pack()
        self._canvas.bind("<Button-1>", self._on_canvas_click)

        self._draw_mic_button()
        self._draw_waveform()

        # ── Hint label ────────────────────────────────────────
        self._hint = tk.Label(
            self.root,
            text="click  🎤  to begin recording",
            font=("Courier New", 9),
            fg=C["dim"],
            bg=C["bg"],
        )
        self._hint.pack(pady=(0, 4))

        # ── Transcript panel ──────────────────────────────────
        panel = tk.Frame(
            self.root,
            bg=C["panel"],
            highlightbackground=C["border"],
            highlightthickness=1,
        )
        panel.pack(fill="both", expand=True, padx=24, pady=(0, 0))

        label_row = tk.Frame(panel, bg=C["panel"])
        label_row.pack(fill="x", padx=12, pady=(8, 0))

        tk.Label(
            label_row,
            text="TRANSCRIPT",
            font=("Courier New", 9, "bold"),
            fg=C["accent"],
            bg=C["panel"],
        ).pack(side="left")

        self._word_lbl = tk.Label(
            label_row,
            text="0 words",
            font=("Courier New", 9),
            fg=C["dim"],
            bg=C["panel"],
        )
        self._word_lbl.pack(side="right")

        self._text = scrolledtext.ScrolledText(
            panel,
            font=("Courier New", 13),
            bg=C["panel"],
            fg=C["text"],
            insertbackground=C["accent"],
            selectbackground="#264f78",
            relief="flat",
            wrap="word",
            padx=12,
            pady=10,
        )
        self._text.pack(fill="both", expand=True, padx=4, pady=(2, 6))
        try:
            self._text.vbar.configure(bg=C["border"], troughcolor=C["panel"])
        except Exception:
            pass

        # ── Bottom toolbar ────────────────────────────────────
        bar = tk.Frame(self.root, bg=C["bg"])
        bar.pack(fill="x", padx=24, pady=10)

        for label, cmd in [("Clear", self._clear), ("Copy All", self._copy)]:
            tk.Button(
                bar,
                text=label,
                font=("Courier New", 10),
                fg=C["dim"],
                bg=C["button"],
                activeforeground=C["text"],
                activebackground="#30363d",
                relief="flat",
                padx=14,
                pady=4,
                cursor="hand2",
                command=cmd,
                bd=0,
            ).pack(side="left", padx=(0, 6))

        self._last_lbl = tk.Label(
            bar, text="", font=("Courier New", 9, "italic"), fg=C["dim"], bg=C["bg"]
        )
        self._last_lbl.pack(side="right")

    # ── Canvas drawing ───────────────────────────────────────────────────────

    def _draw_mic_button(self):
        C = self.COLORS
        cx, cy = 250, 60

        # outer ring
        self._btn_outer = self._canvas.create_oval(
            cx - 52, cy - 52, cx + 52, cy + 52, outline=C["accent"], width=2, fill=""
        )
        # filled circle
        self._btn_circle = self._canvas.create_oval(
            cx - 44, cy - 44, cx + 44, cy + 44, fill=C["button"], outline=""
        )
        # emoji icon
        self._btn_icon = self._canvas.create_text(cx, cy, text="🎤", font=("Arial", 28))

    def _draw_waveform(self):
        C = self.COLORS
        n_bars = 10
        bar_w = 5
        gap = 5
        cx = 250
        r_edge = 52 + 10  # gap from mic circle edge
        cy = 60
        self._wave_bars = []

        for i in range(n_bars):
            offset = i * (bar_w + gap)

            # left side (outermost = index 0)
            x_l = cx - r_edge - offset - bar_w
            bl = self._canvas.create_rectangle(
                x_l, cy, x_l + bar_w, cy, fill=C["dim"], outline="", width=0
            )
            self._wave_bars.append(("L", bl, x_l, cy))

            # right side (mirror)
            x_r = cx + r_edge + offset
            br = self._canvas.create_rectangle(
                x_r, cy, x_r + bar_w, cy, fill=C["dim"], outline="", width=0
            )
            self._wave_bars.append(("R", br, x_r, cy))

    # ── Animation ────────────────────────────────────────────────────────────

    def _animate(self):
        if not self.is_recording:
            return
        t = time.time()
        cx, cy = 250, 60

        # Pulsing outer ring
        pulse = 0.5 + 0.5 * math.sin(t * 5)
        r = 52 + int(pulse * 9)
        self._canvas.coords(self._btn_outer, cx - r, cy - r, cx + r, cy + r)
        ri = int(180 + 75 * pulse)
        ring_col = "#%02x3040" % ri
        self._canvas.itemconfig(self._btn_outer, outline=ring_col, width=2 + pulse * 2)
        self._canvas.itemconfig(self._btn_circle, fill="#2d1b1b")

        # Animated waveform bars
        max_h = 36
        for idx, (side, bar, x, cy_bar) in enumerate(self._wave_bars):
            freq = 2.8 + idx * 0.35
            phase = idx * 0.7
            h = max_h * (0.12 + 0.88 * abs(math.sin(t * freq + phase)))
            self._canvas.coords(bar, x, cy_bar - h / 2, x + 5, cy_bar + h / 2)
            iv = int(90 + 165 * (h / max_h))
            iv = max(0, min(255, iv))
            if side == "L":
                col = "#f8%02x50" % iv
            else:
                col = "#58%02xff" % iv
            self._canvas.itemconfig(bar, fill=col)

        self._after_id = self.root.after(40, self._animate)

    def _reset_canvas(self):
        """Return canvas to idle state."""
        if self._after_id:
            self.root.after_cancel(self._after_id)
            self._after_id = None
        C = self.COLORS
        cx, cy = 250, 60
        self._canvas.coords(self._btn_outer, cx - 52, cy - 52, cx + 52, cy + 52)
        self._canvas.itemconfig(self._btn_outer, outline=C["accent"], width=2)
        self._canvas.itemconfig(self._btn_circle, fill=C["button"])
        for _, bar, x, cy_bar in self._wave_bars:
            self._canvas.coords(bar, x, cy_bar, x + 5, cy_bar)
            self._canvas.itemconfig(bar, fill=C["dim"])

    # ── Recording lifecycle ──────────────────────────────────────────────────

    def _on_canvas_click(self, event):
        cx, cy = 250, 60
        if math.hypot(event.x - cx, event.y - cy) <= 56:
            if self.is_recording:
                self._stop()
            else:
                self._start()

    def _calibrate(self):
        self._set_status("Calibrating microphone…")

        def work():
            try:
                if self.microphone is not None and self.recognizer is not None:
                    with self.microphone as src:
                        self.recognizer.adjust_for_ambient_noise(src, duration=1)
                    self.root.after(
                        0,
                        lambda: self._set_status(
                            "Ready — click  🎤  to start recording"
                        ),
                    )
                else:
                    self.root.after(
                        0, lambda: self._set_status("Microphone not available", "red")
                    )
            except Exception as exc:
                self.root.after(
                    0, lambda e=exc: self._set_status(f"Microphone error: {e}", "red")
                )

        threading.Thread(target=work, daemon=True).start()

    def _start(self):
        if not SR_AVAILABLE or sr is None:
            return
        self.is_recording = True
        self._hint.config(text="click  🎤  to stop recording")
        self._set_status("● Recording — speak now", "green")
        self._animate()
        self._rec_thread = threading.Thread(target=self._record_loop, daemon=True)
        self._rec_thread.start()

    def _stop(self):
        self.is_recording = False
        self._reset_canvas()
        self._hint.config(text="click  🎤  to begin recording")
        self._set_status("Stopped — click  🎤  to start again")

    def _record_loop(self):
        while self.is_recording:
            try:
                if self.microphone is not None and self.recognizer is not None:
                    with self.microphone as src:
                        audio = self.recognizer.listen(
                            src, timeout=7, phrase_time_limit=25
                        )
                else:
                    self.root.after(
                        0,
                        lambda: self._set_status(
                            "Microphone or recognizer not available", "red"
                        ),
                    )
                    break
            except Exception as exc:
                if (
                    SR_AVAILABLE
                    and sr is not None
                    and self.recognizer is not None
                    and self.microphone is not None
                    and isinstance(exc, sr.WaitTimeoutError)
                ):
                    continue
                if self.is_recording:
                    self.root.after(
                        0, lambda e=exc: self._set_status(f"Error: {e}", "red")
                    )
                break

            self.root.after(0, lambda: self._set_status("⟳ Transcribing…"))

            try:
                if self.recognizer is not None:
                    # type: ignore for recognize_google,
                    # as it may not be detected by static analysis
                    text = self.recognizer.recognize_google(audio)  # type: ignore
                else:
                    text = ""
                self.root.after(0, lambda t=text: self._append(t))
                self.root.after(0, lambda: self._set_status("● Recording", "green"))
            except Exception as exc:
                if SR_AVAILABLE and sr is not None:
                    if isinstance(exc, sr.UnknownValueError):
                        self.root.after(
                            0,
                            lambda: self._set_status(
                                "● (nothing recognised) — " "still listening…", "dim"
                            ),
                        )
                        continue
                    elif isinstance(exc, sr.RequestError):
                        self.root.after(
                            0,
                            lambda e=exc: self._set_status(
                                f"Network error: {e}", "red"
                            ),
                        )
                        continue
                # fallback for other exceptions
                self.root.after(
                    0,
                    lambda e=exc: self._set_status(f"Transcription error: {e}", "red"),
                )

    # ── Text helpers ─────────────────────────────────────────────────────────

    def _append(self, text: str):
        if not text:
            return
        capitalised = text[0].upper() + text[1:]
        current = self._text.get("1.0", "end-1c")
        sep = " " if current.strip() and not current.endswith("\n") else ""
        self._text.insert("end", sep + capitalised + ".")
        self._text.see("end")
        self._update_words()
        if len(capitalised) > 50:
            preview = capitalised[:50] + "…"
        else:
            preview = capitalised
        self._last_lbl.config(text=f'Last: "{preview}"')

    def _update_words(self):
        body = self._text.get("1.0", "end-1c").strip()
        n = len(body.split()) if body else 0
        self._word_lbl.config(text=f"{n} word{'s' if n != 1 else ''}")

    def _clear(self):
        self._text.delete("1.0", "end")
        self._update_words()
        self._last_lbl.config(text="")

    def _copy(self):
        self.root.clipboard_clear()
        self.root.clipboard_append(self._text.get("1.0", "end-1c"))
        self._set_status("✓ Copied to clipboard", "green")
        self.root.after(
            2500,
            lambda: self._set_status(
                "● Recording"
                if self.is_recording
                else "Ready — click  🎤  to start recording"
            ),
        )

    def _set_status(self, msg: str, colour: str = "dim"):
        fg = self.COLORS.get(colour, self.COLORS["dim"])
        self._status_lbl.config(text=msg, fg=fg)


# ─────────────────────────────────────────────────────────────────────────────


def main():
    root = tk.Tk()
    try:
        root.tk.call("tk", "scaling", 1.25)
    except Exception:
        pass
    # Give the window a nice icon colour in the taskbar
    try:
        root.wm_attributes("-type", "normal")
    except Exception:
        pass
    DictaphoneApp(root)
    root.mainloop()


if __name__ == "__main__":
    main()
