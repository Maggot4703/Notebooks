# PiMan Quick Start

This guide provides practical Raspberry Pi 5 playbooks for common setup and troubleshooting scenarios.

## Fast Start

1. Boot and log in.
2. Run baseline diagnostics.
3. Fix power and thermal issues first.
4. Validate storage and network.
5. Verify service startup and logs.

## Playbook 1: New Pi 5 Setup (Headless)

1. Update packages:
   - `sudo apt update && sudo apt full-upgrade -y`
2. Enable SSH and verify reachability.
3. Set locale/timezone/hostname.
4. Configure static reservation or static IP if needed.
5. Install required runtime tools (for example Docker, Python packages, Node tooling).
6. Reboot and validate services.

## Playbook 2: Won't Boot Or Random Reboots

1. Check power supply quality and cable.
2. Inspect undervoltage and thermal flags:
   - `vcgencmd get_throttled`
   - `vcgencmd measure_temp`
3. Validate storage health and free space:
   - `df -h`
   - `dmesg | grep -i -E 'mmc|nvme|usb|error'`
4. Review boot errors:
   - `journalctl -p 3 -xb --no-pager`
5. Apply one fix at a time and retest.

## Playbook 3: Slow Performance Or Throttling

1. Check current temp/throttle state.
2. Ensure active cooling and airflow.
3. Reduce sustained load and retest.
4. Confirm no background service runaway:
   - `top`
   - `systemctl --failed --no-pager`
5. Only tune performance after power/thermal stability.

## Playbook 4: Network Issues

1. Verify interface/IP state:
   - `ip -br a`
   - `ip route`
2. Test external reachability and DNS:
   - `ping -c 3 1.1.1.1`
   - `ping -c 3 github.com`
3. Check service ports and firewall rules.
4. Restart network service only if necessary.

## Playbook 5: Service Fails At Startup

1. Confirm unit status and logs:
   - `systemctl status <service> --no-pager`
   - `journalctl -u <service> -b --no-pager`
2. Validate file permissions, working directory, and environment variables.
3. Confirm dependencies (database, network, filesystem mounts).
4. Enable and start after fix:
   - `sudo systemctl enable <service>`
   - `sudo systemctl restart <service>`

## Playbook 6: Run A Python Script On Boot

Use a `systemd` service for background Python jobs. This works on Raspberry Pi OS Lite or desktop and does not require desktop autologin.

1. Test the exact runtime command manually first:
   - `/home/pi/myapp/.venv/bin/python /home/pi/myapp/main.py`
2. Copy the example unit and adapt it for your app:
   - `sudo cp /path/to/pi-python-app.service.example /etc/systemd/system/my-python-app.service`
3. Edit the copied unit and set these fields correctly:
   - `User=`
   - `WorkingDirectory=`
   - `ExecStart=`
4. If the app needs network during boot, keep:
   - `Wants=network-online.target`
   - `After=network-online.target`
5. Reload and test before reboot:
   - `sudo systemctl daemon-reload`
   - `sudo systemctl start my-python-app.service`
   - `sudo systemctl status my-python-app.service --no-pager`
   - `journalctl -u my-python-app.service -b --no-pager`
6. Enable on boot once the manual start is clean:
   - `sudo systemctl enable my-python-app.service`
7. Reboot and verify:
   - `sudo reboot`
   - `systemctl status my-python-app.service --no-pager`
8. Roll back if needed:
   - `sudo systemctl disable --now my-python-app.service`
   - `sudo rm /etc/systemd/system/my-python-app.service`
   - `sudo systemctl daemon-reload`

### Link Scan Notes

- Use absolute paths only.
- Prefer a virtualenv interpreter when the app has non-system dependencies.
- If the Pi is headless, enable SSH so you can inspect logs remotely after reboot.
- On Raspberry Pi OS Bookworm, the boot partition is mounted at `/boot/firmware/`.

## Playbook 7: Scan Docs For Web Links

Use this when you want to inventory links in Markdown, notes, or agent files.

1. Scan common documentation locations for all web links:
   - `rg -n --no-heading -o 'https?://[^)"[:space:]>]+' Manuals/ .github/`
2. Restrict the results to Raspberry Pi links only when needed:
   - `rg -n --no-heading -o 'https?://[^)"[:space:]>]+' Manuals/ .github/ | rg 'raspberrypi\.com|raspberry\.org'`
3. If you want unique links only, sort and de-duplicate:
   - `rg -n --no-heading -o 'https?://[^)"[:space:]>]+' Manuals/ .github/ | sort -u`
4. If you want the source file and line number, keep the `-n` flag.
5. If a doc uses Markdown links, the extracted URL still gives you the destination directly.

### Notes

- Use exact URL extraction instead of manual scanning.
- Expand the search paths if your docs live outside `Manuals/` or `.github/`.
- Pipe to `rg 'raspberrypi\.com'` if you only want official Raspberry Pi links.

## Playbook 8: Play Music Locally

Use this when the Raspberry Pi is running a local desktop session and you want to play a song from `/home/me/Music` without interrupting the workspace.

1. Confirm VLC is installed and available:
   - `command -v vlc`
2. Play one random song from the local music library in minimized mode:
   - `bash /home/me/Notebooks/.github/skills/play-song/play-song.sh`
3. If you want a specific song, pass part of its name:
   - `bash /home/me/Notebooks/.github/skills/play-song/play-song.sh "Africa"`
4. Keep playback as a background task so the terminal remains usable.

### Music Playback Notes

- This is intended for local desktop use, not headless or SSH-only sessions.
- Use null-delimited filenames so spaces and special characters are handled safely.
- Start only one VLC playback command per invocation.
- The helper script matches song names case-insensitively against the full path.

## Operational Defaults

- Keep backup images of known-good SD/NVMe state.
- Use pinned versions for long-running workloads.
- Track changes in small steps with rollback notes.
- Prefer automation scripts for repeatable setup.

## Related Docs

- `.github/agents/PiMan.agent.md`
- `.github/skills/piman/SKILL.md`
- `AI/agents/agents.md`
