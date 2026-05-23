set -euo pipefail
if [ -f CREW/Crew/requirements.txt ]; then
  python -m pip install -r CREW/Crew/requirements.txt
fi
python -m pip install pytest
