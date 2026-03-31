text = """
# UV is a tool for managing Python virtual environments and dependencies. 
# It provides a simple and efficient way to create and manage isolated 
# Python environments for your projects."

# Install uv
# curl -LsSf https://astral.sh/uv/install.sh | sh

# Create a project
# uv init myproject
# cd myproject

# Add dependencies
# uv add requests pandas

# Run a script in the virtual env
# uv run python main.py

# Manage Python versions
# uv python install 3.12
# uv python pin 3.12

cd /home/me/Notebooks/BASH/UV
uv help >./uv_help/uv-help.txt
uv help auth >./uv_help/uv-auth.txt
uv help run >./uv_help/uv-run.txt
uv help init >./uv_help/uv-init.txt
uv help add >./uv_help/uv-add.txt
uv help remove >./uv_help/uv-remove.txt
uv help version >./uv_help/uv-version.txt
uv help sync >./uv_help/uv-sync.txt
uv help lock >./uv_help/uv-lock.txt
uv help export >./uv_help/uv-export.txt
uv help tree >./uv_help/uv-tree.txt
uv help format >./uv_help/uv-format.txt
uv help tool >./uv_help/uv-tool.txt
uv help python >./uv_help/uv-python.txt
uv help pip >./uv_help/uv-pip.txt
uv help venv >./uv_help/uv-venv.txt
uv help build >./uv_help/uv-build.txt
uv help publish >./uv_help/uv-publish.txt
uv help cache >./uv_help/uv-cache.txt
uv help self >./uv_help/uv-self.txt
uv help generate-shell-completion >./uv_help/uv-generate-shell-completion.txt
uv help help >./uv_help/uv-help.txt
tldr uv >./uv_help/tldr-uv.txt
tldr --help >./uv_help/tldr-help.txt


"""

print(text)

