#!/usr/bin/env bash

set -euo pipefail

usage() {
	cat <<'EOF'
Usage:
  install_rpi_startup.sh cli --command "read-csv /path/to/file.csv" [options]
  install_rpi_startup.sh gui [options]

Modes:
  cli   Install a systemd unit that runs a Crew.py CLI subcommand at boot.
  gui   Install a desktop autostart entry that launches the Crew GUI on login.

Options:
  --user NAME              Target user. Default: current user.
  --python PATH            Python interpreter. Default: /home/me/Notebooks/.venv/bin/python
  --repo-root PATH         CREW repository root. Default: /home/me/Notebooks/CREW
  --service-name NAME      systemd unit name without suffix. Default: crew-cli
  --command STRING         Crew.py CLI command string. Required for cli mode.
  --autostart-dir PATH     Desktop autostart directory. Default: /home/<user>/.config/autostart
  --undo                   Remove the installed startup file instead of installing it.
  --help                   Show this help text.

Examples:
  install_rpi_startup.sh cli --command "read-csv /home/pi/data/cards.csv"
  install_rpi_startup.sh cli --command "grid-folder /home/pi/in /home/pi/out"
  install_rpi_startup.sh gui --user pi
  install_rpi_startup.sh gui --undo --user pi
  install_rpi_startup.sh cli --undo --service-name crew-cli
EOF
}

mode="${1:-}"
if [[ -z "$mode" || "$mode" == "--help" || "$mode" == "-h" ]]; then
	usage
	exit 0
fi
shift

target_user="${USER:-me}"
python_path="/home/me/Notebooks/.venv/bin/python"
repo_root="/home/me/Notebooks/CREW"
service_name="crew-cli"
crew_command=""
autostart_dir=""
undo=0

while [[ $# -gt 0 ]]; do
	case "$1" in
		--user)
			target_user="$2"
			shift 2
			;;
		--python)
			python_path="$2"
			shift 2
			;;
		--repo-root)
			repo_root="$2"
			shift 2
			;;
		--service-name)
			service_name="$2"
			shift 2
			;;
		--command)
			crew_command="$2"
			shift 2
			;;
		--autostart-dir)
			autostart_dir="$2"
			shift 2
			;;
		--undo)
			undo=1
			shift
			;;
		--help|-h)
			usage
			exit 0
			;;
		*)
			echo "Unknown option: $1" >&2
			usage >&2
			exit 1
			;;
	 esac
	done

crew_script="$repo_root/Crew/Crew.py"
autostart_dir="${autostart_dir:-/home/$target_user/.config/autostart}"

if [[ $undo -eq 0 ]]; then
	if [[ ! -f "$crew_script" ]]; then
		echo "Crew entrypoint not found: $crew_script" >&2
		exit 1
	fi
	if [[ ! -x "$python_path" ]]; then
		echo "Python interpreter not executable: $python_path" >&2
		exit 1
	fi
fi

uninstall_cli() {
	unit_path="/etc/systemd/system/${service_name}.service"
	if [[ ! -f "$unit_path" ]]; then
		echo "No unit file found at $unit_path — nothing to remove." >&2
		return 0
	fi
	sudo systemctl disable --now "${service_name}.service" || true
	sudo rm -f "$unit_path"
	sudo systemctl daemon-reload
	echo "Removed: $unit_path"
	echo "systemd reloaded. Service will not start on next boot."
}

uninstall_gui() {
	desktop_path="$autostart_dir/crew-gui.desktop"
	if [[ ! -f "$desktop_path" ]]; then
		echo "No autostart file found at $desktop_path — nothing to remove." >&2
		return 0
	fi
	rm -f "$desktop_path"
	echo "Removed: $desktop_path"
	echo "Crew GUI will no longer auto-start on desktop login."
}

install_cli() {
	if [[ $undo -eq 1 ]]; then
		uninstall_cli
		return
	fi
	if [[ -z "$crew_command" ]]; then
		echo "cli mode requires --command" >&2
		exit 1
	fi

	unit_path="/etc/systemd/system/${service_name}.service"

	sudo tee "$unit_path" >/dev/null <<EOF
[Unit]
Description=Crew CLI task on Raspberry Pi boot
Wants=network-online.target
After=network-online.target

[Service]
Type=oneshot
User=$target_user
WorkingDirectory=$repo_root
Environment=PYTHONPATH=$repo_root/src
Environment=PYTHONUNBUFFERED=1
ExecStart=/bin/sh -lc 'exec $python_path $crew_script $crew_command'

[Install]
WantedBy=multi-user.target
EOF

	sudo systemctl daemon-reload
	sudo systemctl enable "$service_name.service"
	echo "Installed: $unit_path"
	echo "Next: sudo systemctl start $service_name.service"
	echo "Check: sudo systemctl status $service_name.service --no-pager"
}

install_gui() {
	if [[ $undo -eq 1 ]]; then
		uninstall_gui
		return
	fi
	mkdir -p "$autostart_dir"
	desktop_path="$autostart_dir/crew-gui.desktop"

	cat >"$desktop_path" <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Crew GUI
Comment=Start the Crew Tkinter GUI on desktop login
Exec=$python_path $crew_script
Path=$(dirname "$crew_script")
Terminal=false
X-GNOME-Autostart-enabled=true
EOF

	echo "Installed: $desktop_path"
	echo "Log in to the desktop session and the Crew GUI will auto-start."
}

case "$mode" in
	cli)
		install_cli
		;;
	gui)
		install_gui
		;;
	*)
		echo "Unknown mode: $mode" >&2
		usage >&2
		exit 1
		;;
esac