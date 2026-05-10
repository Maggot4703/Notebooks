# Crew Linux Installer Bundle

This folder packages the minimum portable subset of the Notebooks repo needed
to run `CREW/Crew` on another Linux desktop while preserving Crew's expected
relative paths.

## What is bundled

- `payload/CREW/Crew/` - the Crew application, runtime modules, assets,
  starter data, strategies, scripts, and ReadMine seed files
- `payload/CREW/docs/fetchdocs_readmine.md` - the ReadMine guide that Crew
  opens from the GUI
- `payload/CARDCUTTER/CardCutter/gimp/` - bundled `Cars*.png` images so the
  default image-processing paths resolve without the full repo
- installer helpers: `install.sh`, `launch-crew.sh`, `uninstall.sh`
- dependency manifests: `requirements-lock.txt`, `system-packages.txt`

## Copy to another machine

Copy this archive from the source machine:

```text
/home/me/Notebooks/CREW/INSTALLER/crew-linux.tar.gz
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
