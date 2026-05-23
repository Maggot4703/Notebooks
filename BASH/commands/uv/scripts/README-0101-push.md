Files created:
- scripts/0101-server.service: systemd unit to run 0101 server on p48 with DESKTOP_PUSH_TARGET set to me@home:~/Desktop/0101_notes/
- scripts/p48_push_test.sh: helper script to install the unit, start the service, POST a test note, and check me@home for the mirrored file.

Purpose

This document describes how to make the 0101 server the authoritative pusher of saved notes (recommended), and how to deprecate the older p48 watcher that performed periodic rsyncs.

Quick summary

- Server-driven (authoritative) push: set DESKTOP_PUSH_TARGET and run the server; the server will rsync saved/ to the target on each save and enqueue failed pushes for retry.
- Watcher (deprecated): an optional external p48 watcher (systemd unit or cron job) can be used as a fallback. When the server is authoritative, stop/disable the watcher to avoid duplicate pushes.

Making the server authoritative (recommended)

1. Ensure the server environment exposes a push target. Example (systemd unit or startup script):

   DESKTOP_PUSH_TARGET='me@home:~/Desktop/0101_notes/' \
   DESKTOP_PUSH_MODE='authoritative' \
   python3 /home/me/Notebooks/0101/0101/src/public_html/server.py &

   - DESKTOP_PUSH_MODE can be 'authoritative' (default), 'watcher' (favor external watcher), or 'disabled' (no server push attempts).

2. If running as a systemd service on the host (e.g. p48), update scripts/0101-server.service Environment= lines to include the desired DESKTOP_PUSH_TARGET and restart the unit:

   sudo systemctl daemon-reload
   sudo systemctl restart 0101-server.service

Deprecate / stop the p48 watcher

If you previously installed a watcher service (systemd unit or --user), stop and disable it to avoid duplicate rsync activity. Use the appropriate command for how the watcher was installed:

- For a user systemd unit (common on p48):

  systemctl --user stop watch_push_0101.service || true
  systemctl --user disable watch_push_0101.service || true

- For a system-level unit:

  sudo systemctl stop watch_push_0101.service || true
  sudo systemctl disable watch_push_0101.service || true

You may also remove or archive the watcher unit file after verifying the server push is working.

Verifying and troubleshooting

- Admin UI: visit http://<server-host>:8080/admin/push-queue to inspect queued jobs, retry individual jobs, or delete stale jobs.
- CLI: scripts/push_queue.py can be used to list/clear jobs from the host running the server.
- If remote rsync fails due to SSH issues, server will enqueue jobs in saved/push_queue/ for later retry. Inspect saved/push_queue/ on the server to view job JSON files.

Rollback

To re-enable the watcher if needed:

  systemctl --user enable --now watch_push_0101.service

Notes

- Keep push-queue available as a safety net; it is intentionally retained even when server is authoritative.
- For automated installs, update any deployment playbooks to set DESKTOP_PUSH_MODE and remove watcher enablement steps.
1. Copy scripts/0101-server.service to /etc/systemd/system/0101-server.service on p48 (the provided p48_push_test.sh does this for you).
2. Ensure SSH key-based access exists: from p48 run `ssh-copy-id me@home`.
3. Run on p48: sudo bash /home/me/Notebooks/scripts/p48_push_test.sh

Notes:
- Adjust WorkingDirectory and User in the unit if 0101 is located elsewhere or a different user should run the service.
- If you prefer not to install systemd unit, run the server manually with:
  DESKTOP_PUSH_TARGET='me@home:~/Desktop/0101_notes/' setsid env DESKTOP_PUSH_TARGET="me@home:~/Desktop/0101_notes/" python3 /home/me/Notebooks/0101/0101/src/public_html/server.py &
