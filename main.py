import os
import json
import argparse


def main():
    parser = argparse.ArgumentParser(description="Notebooks main entry point")
    parser.add_argument("--persona", type=str, help="Persona for chatbot session")
    parser.add_argument(
        "--context-window", type=int, help="Context window size for chatbot session"
    )
    args = parser.parse_args()

    config_path = os.path.join(os.path.dirname(__file__), "config.json")
    if os.path.exists(config_path):
        with open(config_path, "r") as f:
            config = json.load(f)
        persona = config.get("persona", "default")
        context_window = config.get("context_window", 10)
    else:
        persona = "default"
        context_window = 10

    # Override with CLI args if provided
    if args.persona:
        persona = args.persona
    if args.context_window:
        context_window = args.context_window

    session_state = {
        "persona": persona,
        "context_window": context_window,
        "history": [],
    }
    print(
        f"[session_state] persona: {session_state['persona']}, context_window: {session_state['context_window']}"
    )
    readme_path = None
    for root, dirs, files in os.walk(os.path.dirname(__file__)):
        if "README.md" in files:
            readme_path = os.path.join(root, "README.md")
            break

    if readme_path and os.path.exists(readme_path):
        with open(readme_path, "r") as f:
            print("\n--- README.md ---\n")
            print(f.read())
            print("\n--- End of README.md ---\n")
    else:
        print("README.md not found.")


if __name__ == "__main__":
    main()
