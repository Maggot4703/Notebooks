set -euo pipefail
cd 0101/0101
./node_modules/.bin/playwright test --workers=1 --retries=0 --reporter=list
