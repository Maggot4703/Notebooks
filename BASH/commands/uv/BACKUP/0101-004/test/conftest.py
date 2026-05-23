import os
import sys

# Ensure tests can import the server module located under 0101/src/public_html
ROOT = os.path.abspath(
    os.path.join(os.path.dirname(__file__), "..", "0101", "src", "public_html")
)
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)
