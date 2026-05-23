#!/usr/bin/env bash
set -euo pipefail

# Usage: run this on p48 as the 'me' user. Requires sudo to install systemd unit.
SERVICE_PATH="/etc/systemd/system/0101-server.service"
WORKDIR="/home/me/Notebooks/0101/0101/src/public_html"
DESKTOP_PUSH_TARGET='me@home:~/Desktop/0101_notes/'

cat >/tmp/0101-server.service <<'EOF'
[Unit]
Description=0101 server
After=network.target

[Service]
Type=simple
Environment=DESKTOP_PUSH_TARGET=me@home:~/Desktop/0101_notes/
WorkingDirectory=/home/me/Notebooks/0101/0101/src/public_html
ExecStart=/usr/bin/env python3 server.py
Restart=on-failure
User=me
KillMode=process

[Install]
WantedBy=multi-user.target
EOF

sudo mv /tmp/0101-server.service "$SERVICE_PATH"
sudo systemctl daemon-reload
sudo systemctl enable --now 0101-server.service

sleep 2

echo "Posting test note to local server..."
curl -s -X POST --data-binary 'hello-from-p48' http://127.0.0.1:8080/api/text/p48-test -w '\nHTTP:%{http_code}\n'

sleep 1

echo "Checking on me@home for mirrored file..."
ssh -o BatchMode=yes me@home "ls -l ~/Desktop/0101_notes/p48-test.txt && cat ~/Desktop/0101_notes/p48-test.txt || echo 'no file found'"
