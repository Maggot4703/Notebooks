from turtle import home
#from CREW import Crew
import subprocess


def main():
    print("Hello from crew!")
    # To run Crew.py, use subprocess or run it directly from the terminal.
    subprocess.run(["python", "/home/me/Notebooks/CREW/Crew/Crew.py"])
    import os
    os.chdir("/home/me/Notebooks/CREW/Crew")
    # The following commands are shell commands; to run them from Python, use subprocess:
    subprocess.run(["uv", "sync"])
    #subprocess.run(["uv", "run", "jupyter", "lab"])
    subprocess.run(["uv", "run", "python", "Crew.py"])


if __name__ == "__main__":
    main()
