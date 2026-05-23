# VTT Workspace

This folder contains notebooks, scripts, and resources related to Virtual Tabletop (VTT) workflows, automation, and experiments.

## Structure

- **Notebooks**: Jupyter notebooks for VTT-related tasks and automation.
- **Scripts**: Python or shell scripts for processing, conversion, or integration with VTT tools.
- **Assets**: Any images, maps, or data files used in VTT projects.

## Usage

1. Open the VTT notebooks in VS Code or JupyterLab.
2. Run cells to process assets, automate tasks, or experiment with VTT workflows.
3. Use provided scripts for batch operations or integration with other tools.

## Requirements

- Python 3.8+
- JupyterLab or VS Code with Jupyter extension
- Additional dependencies as specified in `pyproject.toml` or notebook cells


## Startup Script

To set up the environment and start JupyterLab for this workspace:

```bash
cd /home/me/Notebooks/VTT
uv sync
uv run jupyter lab
```

This ensures all dependencies are installed and launches the notebook interface in the correct environment.

## Tips

- Organize your VTT assets and scripts in subfolders for clarity.
- Refer to the main workspace README for environment setup and troubleshooting.

---

For more information, see the notebooks in this folder or the main workspace documentation.

## Startup Code

```bash
cd /home/me/Notebooks/VTT
uv sync
#uv run jupyter lab
uv run main.py
```
