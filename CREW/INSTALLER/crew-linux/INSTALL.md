# Crew Linux Installer Bundle

This folder packages the minimum portable subset of the Notebooks repo needed
to run `CREW/Crew` on another Linux desktop while preserving Crew's expected
relative paths.

## What is bundled

- `payload/CREW/Crew/` - the Crew application and runtime. Top-level files and directories include:
  - Crew.py, run_gui.py, launch_gui.py, run_gui.py, README.md, ReadMine.py, read_books.txt, requirements.txt, setup.cfg
  - Python modules: __init__.py, audio_manager.py, cache.py, cli.py, config.py, crew_auth.py, data_manager.py, database_manager.py, deepseek_integration.py, enhanced_features.py, enhanced_fetch_docs.py, error_handler.py, errors.py, event_manager.py, file_manager.py, file_utils.py, globals.py, gui.py, gui_main_function.py, image_utils.py, layout.py, logic.py, mcp.py, mcp_service.py, message_router.py, mobile_remote.py, script_manager.py, state_manager.py, storySearch.py, traveller5_scraper.py, traveller_agent.py, traveller_wiki_api.py, travellermap_api.py, tts_manager.py, ui_manager.py, utils.py
  - Directories: data/, docs/, input/, scripts/, strategies/, "Reading Now" (user content directory), output/ (created at runtime)
- `payload/CREW/docs/fetchdocs_readmine.md` - the ReadMine guide opened by Crew
- `payload/CARDCUTTER/CardCutter/gimp/` - compatibility image assets (Cars*.png) so Crew's image-processing paths work without the full repo
- Installer helpers: `install.sh`, `launch-crew.sh`, `uninstall.sh`, `crew.desktop`
- Dependency manifests: `requirements-lock.txt` (pip package pins), `system-packages.txt` (Debian/Ubuntu package names; installer will skip if --skip-system-packages is used)

Note: manifest.txt in this folder contains a machine-readable list of the files included in the bundle.

## Copy to another machine

Copy this archive from the source machine:

```text
/home/me/Notebooks/CREW/INSTALLER/crew-linux.tar.gz  (trimmed bundle created from current CREW files)
```

Example transfer options:

```bash
scp /home/me/Notebooks/CREW/INSTALLER/crew-linux.tar.gz user@other-machine:~/Downloads/
```

or copy it with a USB drive, shared folder, or any other file transfer method.

## Install on the other machine

```bash
mkdir -p ~/Downloads/crew
cd ~/Downloads/crew
tar -xzf ~/Downloads/crew-linux.tar.gz
cd crew-linux
chmod +x install.sh launch-crew.sh uninstall.sh
./install.sh
```

## Install

```bash
cd crew-linux
chmod +x install.sh launch-crew.sh uninstall.sh
./install.sh
```

Default install target:

```text
~/.local/opt/crew-linux
```

Use a custom target:

```bash
./install.sh --target /opt/crew-linux
```

Skip Linux package installation if you already installed them:

```bash
./install.sh --skip-system-packages
```

## Launch

After install:

```bash
~/.local/opt/crew-linux/launch-crew.sh
```

The installer also writes a desktop entry to:

```text
~/.local/share/applications/crew.desktop
```

## Notes

- The bundle intentionally excludes user-local state such as `config.json`,
  `readmine_progress.json`, `*.db`, `*.wav`, logs, and caches.
- Those files are created on the target machine as Crew runs.
- `CREW_INPUT_DIR` and `CREW_OUTPUT_DIR` are set by `launch-crew.sh` so Crew's
  default image-processing paths work without the full `Notebooks` checkout.
- DeepSeek HTTP integration still expects a separately running local endpoint at
  `http://localhost:8000`.
- The 0101 launcher in Crew still expects a separate 0101 deployment and is not
  bundled in this installer folder.

## Manifest and verification

This trimmed bundle includes a machine-readable manifest at:

```text
manifest.txt
```

It lists every file included under the bundle root. To verify the bundle after transfer on the target machine:

1. Check the archive's SHA256 checksum (provided alongside the tarball):

```bash
sha256sum crew-linux.tar.gz
# compare against the recorded value in crew-linux.tar.gz.sha256
```

2. Extract and compare manifest entries:

```bash
mkdir crew && tar -xzf crew-linux.tar.gz -C crew
cd crew
sha256sum ../crew-linux.tar.gz  # optional re-check
sort manifest.txt > /tmp/manifest.sorted
(find . -type f | sed 's|^./||' | sort) > /tmp/actual.sorted
diff -u /tmp/manifest.sorted /tmp/actual.sorted || echo "Manifest mismatch"
```

3. If verification passes, run the installer. To avoid installing system packages on the target, run with --skip-system-packages:

```bash
./install.sh --skip-system-packages
```

If you want, the manifest can be included directly in README or published alongside the tarball for reproducibility.
