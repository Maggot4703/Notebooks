set -euo pipefail
mkdir -p ci-artifacts
nohup python 0101/0101/src/public_html/server.py > ci-artifacts/server_ci.log 2>&1 &
echo $! > ci-artifacts/server.pid
