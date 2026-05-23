set -euo pipefail
git ls-files -s | awk '$1=="160000"{print $4}' | while read -r p; do
  if [ -f .gitmodules ] && grep -q "path = $p" .gitmodules; then
    echo "Skipping submodule path: $p"
  else
    git rm --cached -r "$p" || true
  fi
done || true
