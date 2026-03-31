#!/usr/bin/env bash

if [ -z "${BASH_VERSION:-}" ]; then
	exec bash "$0" "$@"
fi

set -euo pipefail

repo_root="$(cd "$(dirname "$0")" && pwd)"
template_file="$repo_root/startup-template.txt"
jupyter_config_dir_name=".jupyter"
jupyter_config_file_name="jupyter_server_config.json"
jupyter_legacy_config_file_name="jupyter_server_config.py"
# Disable optional frontend build checks to avoid non-fatal nodejs warnings.
jupyter_config_content=$'{\n'
jupyter_config_content+=$'  "ServerApp": {\n'
jupyter_config_content+=$'    "tornado_settings": {\n'
jupyter_config_content+=$'      "page_config_data": {\n'
jupyter_config_content+=$'        "buildCheck": false,\n'
jupyter_config_content+=$'        "buildAvailable": false\n'
jupyter_config_content+=$'      }\n'
jupyter_config_content+=$'    }\n'
jupyter_config_content+=$'  }\n'
jupyter_config_content+=$'}\n'

escape_sed_replacement() {
	printf '%s' "$1" | sed 's/[&\\]/\\&/g'
}

if [ ! -f "$template_file" ]; then
	echo "Missing template: $template_file" >&2
	exit 1
fi

# Keep startup generation explicit and predictable across top-level workspaces.
declare -a startup_dirs=(
	"$repo_root"
	"$repo_root/AI"
	"$repo_root/BASH"
	"$repo_root/CALIBRE"
	"$repo_root/CARDCUTTER"
	"$repo_root/CREW"
	"$repo_root/JUPYTERLAB"
	"$repo_root/PYTHON"
)

for dir in "${startup_dirs[@]}"; do
	startup_file="$dir/startup.txt"
	jupyter_config_dir="$dir/$jupyter_config_dir_name"
	jupyter_config_file="$jupyter_config_dir/$jupyter_config_file_name"
	legacy_jupyter_config_file="$jupyter_config_dir/$jupyter_legacy_config_file_name"
	escaped_dir="$(escape_sed_replacement "$dir")"
	cp "$template_file" "$startup_file"
	# Replace template token with the absolute workspace directory.
	sed -i "s|__STARTUP_DIR__|$escaped_dir|" "$startup_file"
	mkdir -p "$jupyter_config_dir"
	# Remove legacy Python config so JSON config remains the single source of truth.
	rm -f "$legacy_jupyter_config_file"
	printf '%s' "$jupyter_config_content" > "$jupyter_config_file"
	printf 'Wrote: %s\n' "$startup_file"
	printf 'Wrote: %s\n' "$jupyter_config_file"
done