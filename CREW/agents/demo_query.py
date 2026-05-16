import sys
import os

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
from agents.traveller_agent import TravellerAgent

if __name__ == "__main__":
    traveller = TravellerAgent()
    result = traveller.ask_researcher("What are the latest travel policy changes?")
    print(result)
