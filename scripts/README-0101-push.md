Files created:
- scripts/0101-server.service: systemd unit to run 0101 server on p48 with DESKTOP_PUSH_TARGET set to me@home:~/Desktop/0101_notes/
- scripts/p48_push_test.sh: helper script to install the unit, start the service, POST a test note, and check me@home for the mirrored file.

How to use:
1. Copy scripts/0101-server.service to /etc/systemd/system/0101-server.service on p48 (the provided p48_push_test.sh does this for you).
2. Ensure SSH key-based access exists: from p48 run `ssh-copy-id me@home`.
3. Run on p48: sudo bash /home/me/Notebooks/scripts/p48_push_test.sh

Notes:
- Adjust WorkingDirectory and User in the unit if 0101 is located elsewhere or a different user should run the service.
- If you prefer not to install systemd unit, run the server manually with:
  DESKTOP_PUSH_TARGET='me@home:~/Desktop/0101_notes/' setsid env DESKTOP_PUSH_TARGET="me@home:~/Desktop/0101_notes/" python3 /home/me/Notebooks/0101/0101/src/public_html/server.py &
