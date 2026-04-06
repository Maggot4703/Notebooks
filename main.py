import os

def main():
    print("Hello from notebooks!")
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
