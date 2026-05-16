# This file is a symlink to the main batch script for the batch-ocr-counters skill.
# It allows the skill to be invoked from the skills directory or referenced by other tools.
import os
import sys

SCRIPT_PATH = os.path.join(os.path.dirname(__file__), "../../batch_ocr_counters.py")
if __name__ == "__main__":
    sys.path.insert(0, os.path.dirname(SCRIPT_PATH))
    with open(SCRIPT_PATH, "rb") as f:
        code = compile(f.read(), SCRIPT_PATH, "exec")
        exec(code, globals())
