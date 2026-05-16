import sys

REQUIRED_MAJOR = 3
REQUIRED_MINOR = 12


def main():
    version = sys.version_info
    if (version.major, version.minor) != (REQUIRED_MAJOR, REQUIRED_MINOR):
        print(
            f"ERROR: Python {REQUIRED_MAJOR}.{REQUIRED_MINOR} is required. You are using Python {version.major}.{version.minor}."
        )
        sys.exit(1)
    print(f"Python {REQUIRED_MAJOR}.{REQUIRED_MINOR} detected. Compatible.")


if __name__ == "__main__":
    main()
