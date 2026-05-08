from __future__ import annotations

import argparse
import getpass
import json
import os
import secrets
import shlex
import shutil
import socket
import subprocess
import sys
import textwrap
from pathlib import Path
from typing import Any


CONFIG_DIR = Path.home() / ".config" / "notebooks-backup"
CONFIG_PATH = CONFIG_DIR / "config.json"
PASSWORD_PATH = CONFIG_DIR / "restic-password.txt"
DEFAULT_REPOSITORY_SUBDIR = "notebooks-restic"
DEFAULT_BACKUP_TAG = "notebooks-backup"
DEFAULT_KEEP_DAILY = 7
DEFAULT_KEEP_WEEKLY = 4
DEFAULT_KEEP_MONTHLY = 12
DEFAULT_EXCLUDES = [
    ".cache",
    ".local/share/Trash",
    ".npm",
    ".cargo/registry",
    ".cargo/git",
    ".venv",
    "__pycache__",
    ".pytest_cache",
]
COMMON_SOURCE_DIRS = [
    "Notebooks",
    "Documents",
    "Desktop",
    "Pictures",
    "Music",
    "Videos",
    ".ssh",
    ".config",
]
LSBLK_COLUMNS = (
    "NAME,PATH,TYPE,FSTYPE,LABEL,UUID,MODEL,SIZE,RM,HOTPLUG,TRAN,RO,MOUNTPOINTS"
)


def fail(message: str) -> None:
    raise SystemExit(message)


def format_bytes(size: int) -> str:
    units = ["B", "KiB", "MiB", "GiB", "TiB", "PiB"]
    value = float(size)
    for unit in units:
        if value < 1024.0 or unit == units[-1]:
            return f"{value:.1f} {unit}"
        value /= 1024.0
    return f"{size} B"


def normalize_host(host: str | None) -> str:
    if not host:
        return "localhost"
    return host.split("@", 1)[-1].strip().lower()


def current_host() -> str:
    return socket.gethostname().split(".", 1)[0]


def default_repository_host() -> str:
    return f"{getpass.getuser()}@{current_host()}"


def host_is_local(host: str | None) -> bool:
    normalized = normalize_host(host)
    local_names = {
        "localhost",
        "127.0.0.1",
        current_host().lower(),
        socket.getfqdn().split(".", 1)[0].lower(),
        socket.getfqdn().lower(),
    }
    return normalized in local_names


def ensure_config_dir() -> None:
    CONFIG_DIR.mkdir(parents=True, exist_ok=True)


def default_config() -> dict[str, Any]:
    return {
        "repository": {},
        "hosts": {},
        "schedule": {},
        "retention": {
            "keep_daily": DEFAULT_KEEP_DAILY,
            "keep_weekly": DEFAULT_KEEP_WEEKLY,
            "keep_monthly": DEFAULT_KEEP_MONTHLY,
        },
    }


def load_config() -> dict[str, Any]:
    if not CONFIG_PATH.exists():
        return default_config()
    with CONFIG_PATH.open("r", encoding="utf-8") as handle:
        data = json.load(handle)
    config = default_config()
    for key, value in data.items():
        if isinstance(value, dict) and isinstance(config.get(key), dict):
            config[key].update(value)
        else:
            config[key] = value
    return config


def save_config(config: dict[str, Any]) -> None:
    ensure_config_dir()
    with CONFIG_PATH.open("w", encoding="utf-8") as handle:
        json.dump(config, handle, indent=2, sort_keys=True)
        handle.write("\n")


def run_command(
    command: list[str],
    *,
    env: dict[str, str] | None = None,
    check: bool = True,
) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        command,
        capture_output=True,
        text=True,
        check=check,
        env=env,
    )


def run_remote(host: str, command: str, *, check: bool = True) -> subprocess.CompletedProcess[str]:
    return run_command(["ssh", host, command], check=check)


def parse_df_output(output: str) -> dict[str, dict[str, int]]:
    usage: dict[str, dict[str, int]] = {}
    for line in output.splitlines()[1:]:
        parts = line.split()
        if len(parts) < 6:
            continue
        usage[parts[5]] = {
            "size": int(parts[1]),
            "available": int(parts[3]),
        }
    return usage


def get_df_usage(host: str | None) -> dict[str, dict[str, int]]:
    command = "df -B1 -P"
    if host_is_local(host):
        result = run_command(command.split())
    else:
        result = run_remote(host or "", command)
    return parse_df_output(result.stdout)


def get_lsblk_data(host: str | None) -> dict[str, Any]:
    command = f"lsblk -J -b -o {LSBLK_COLUMNS}"
    if host_is_local(host):
        result = run_command(command.split())
    else:
        result = run_remote(host or "", command)
    return json.loads(result.stdout)


def iter_block_devices(devices: list[dict[str, Any]]) -> list[dict[str, Any]]:
    flattened: list[dict[str, Any]] = []
    for device in devices:
        flattened.append(device)
        flattened.extend(iter_block_devices(device.get("children", [])))
    return flattened


def pick_mountpoint(device: dict[str, Any]) -> str | None:
    mountpoints = device.get("mountpoints") or []
    for mountpoint in mountpoints:
        if mountpoint:
            return mountpoint
    return None


def get_drive_candidates(host: str | None) -> list[dict[str, Any]]:
    df_usage = get_df_usage(host)
    devices = get_lsblk_data(host).get("blockdevices", [])
    candidates: list[dict[str, Any]] = []
    seen_mountpoints: set[str] = set()
    for device in iter_block_devices(devices):
        mountpoint = pick_mountpoint(device)
        fstype = device.get("fstype")
        if not mountpoint or not fstype:
            continue
        if mountpoint in seen_mountpoints:
            continue
        if device.get("ro") or mountpoint.startswith("/snap"):
            continue
        usage = df_usage.get(mountpoint)
        if not usage:
            continue
        seen_mountpoints.add(mountpoint)
        candidates.append(
            {
                "path": device.get("path") or "",
                "mountpoint": mountpoint,
                "label": device.get("label") or "",
                "uuid": device.get("uuid") or "",
                "model": device.get("model") or "",
                "fstype": fstype,
                "size_bytes": usage["size"],
                "available_bytes": usage["available"],
                "transport": device.get("tran") or "",
                "removable": bool(device.get("rm")) or bool(device.get("hotplug")),
            }
        )
    return sorted(
        candidates,
        key=lambda item: (item["available_bytes"], item["size_bytes"]),
        reverse=True,
    )


def print_drive_table(candidates: list[dict[str, Any]], host: str | None) -> None:
    if not candidates:
        host_label = host or "localhost"
        fail(f"No mounted block devices found on {host_label}.")
    print(f"Mounted drives on {host or 'localhost'} (largest free space first):")
    for index, candidate in enumerate(candidates, start=1):
        flags = []
        if candidate["removable"]:
            flags.append("removable")
        if candidate["transport"]:
            flags.append(candidate["transport"])
        flag_text = f" [{' '.join(flags)}]" if flags else ""
        label = candidate["label"] or "-"
        uuid = candidate["uuid"] or "-"
        print(
            f"{index:>2}. {candidate['mountpoint']} "
            f"(free {format_bytes(candidate['available_bytes'])} / "
            f"size {format_bytes(candidate['size_bytes'])}, "
            f"label {label}, uuid {uuid}, fs {candidate['fstype']}){flag_text}"
        )


def choose_drive(
    candidates: list[dict[str, Any]],
    selection: int | None,
) -> dict[str, Any]:
    if selection is None:
        raw = input("Select drive number to host the shared restic repository: ").strip()
        if not raw.isdigit():
            fail("Drive selection must be a number.")
        selection = int(raw)
    if selection < 1 or selection > len(candidates):
        fail("Selected drive index is out of range.")
    return candidates[selection - 1]


def current_host_profile(config: dict[str, Any]) -> dict[str, Any]:
    host_name = current_host()
    profile = config["hosts"].setdefault(host_name, {})
    if "sources" not in profile:
        profile["sources"] = [str(path) for path in default_sources()]
    if "excludes" not in profile:
        profile["excludes"] = list(DEFAULT_EXCLUDES)
    return profile


def default_sources() -> list[Path]:
    home = Path.home()
    sources = [home / name for name in COMMON_SOURCE_DIRS]
    return [path for path in sources if path.exists()]


def ensure_restic() -> str:
    restic_path = shutil.which("restic")
    if not restic_path:
        fail("restic is required but not installed. Install it first on both machines.")
    return restic_path


def ensure_password_file(config: dict[str, Any]) -> Path:
    configured = config["repository"].get("password_file")
    password_file = Path(configured).expanduser() if configured else PASSWORD_PATH
    password_file.parent.mkdir(parents=True, exist_ok=True)
    if not password_file.exists():
        password_file.write_text(secrets.token_hex(32) + "\n", encoding="utf-8")
        password_file.chmod(0o600)
    config["repository"]["password_file"] = str(password_file)
    save_config(config)
    return password_file


def repository_path(config: dict[str, Any]) -> str:
    path = config["repository"].get("path")
    if not path:
        fail("No repository path is configured. Run select-drive first.")
    return path


def repository_host(config: dict[str, Any]) -> str:
    return config["repository"].get("host") or default_repository_host()


def repository_spec(config: dict[str, Any]) -> str:
    host = repository_host(config)
    path = repository_path(config)
    if host_is_local(host):
        return path
    return f"sftp:{host}:{path}"


def restic_env(config: dict[str, Any]) -> dict[str, str]:
    password_file = ensure_password_file(config)
    env = os.environ.copy()
    env["RESTIC_PASSWORD_FILE"] = str(password_file)
    env["RESTIC_REPOSITORY"] = repository_spec(config)
    return env


def repository_exists(config: dict[str, Any]) -> bool:
    host = repository_host(config)
    path = repository_path(config)
    if host_is_local(host):
        return (Path(path) / "config").exists()
    command = f"test -f {shlex.quote(path)}/config"
    result = run_remote(host, command, check=False)
    return result.returncode == 0


def ensure_repository_directory(config: dict[str, Any]) -> None:
    host = repository_host(config)
    path = repository_path(config)
    if host_is_local(host):
        Path(path).mkdir(parents=True, exist_ok=True)
        return
    run_remote(host, f"mkdir -p {shlex.quote(path)}")


def resolve_snapshot(config: dict[str, Any], snapshot: str, host_name: str | None) -> str:
    if snapshot != "latest":
        return snapshot
    command = ["restic", "snapshots", "--json"]
    if host_name:
        command.extend(["--host", host_name])
    result = run_command(command, env=restic_env(config))
    snapshots = json.loads(result.stdout)
    if not snapshots:
        fail("No snapshots were found in the repository.")
    snapshots.sort(key=lambda item: item["time"])
    return snapshots[-1]["short_id"]


def write_unit(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def default_backup_calendar(host_name: str) -> str:
    hour = 2 + (sum(host_name.encode("utf-8")) % 3)
    minute = 10 + (sum(host_name.encode("utf-8")) % 40)
    return f"*-*-* {hour:02d}:{minute:02d}:00"


def default_prune_calendar(host_name: str) -> str:
    hour = 5 + (sum(host_name.encode("utf-8")) % 2)
    minute = 15 + (sum(host_name.encode("utf-8")) % 30)
    return f"Sun *-*-* {hour:02d}:{minute:02d}:00"


def render_backup_service(script_path: Path) -> str:
    return textwrap.dedent(
        f"""\
        [Unit]
        Description=Run notebooks restic backup
        Wants=network-online.target
        After=network-online.target

        [Service]
        Type=oneshot
        ExecStart={shlex.quote(sys.executable)} {shlex.quote(str(script_path))} backup
        Nice=10
        IOSchedulingClass=best-effort
        IOSchedulingPriority=7
        """
    )


def render_backup_timer(calendar: str) -> str:
    return textwrap.dedent(
        f"""\
        [Unit]
        Description=Schedule notebooks restic backup

        [Timer]
        OnCalendar={calendar}
        RandomizedDelaySec=15m
        Persistent=true

        [Install]
        WantedBy=timers.target
        """
    )


def render_prune_service(script_path: Path) -> str:
    return textwrap.dedent(
        f"""\
        [Unit]
        Description=Prune notebooks restic snapshots
        Wants=network-online.target
        After=network-online.target

        [Service]
        Type=oneshot
        ExecStart={shlex.quote(sys.executable)} {shlex.quote(str(script_path))} prune
        Nice=19
        IOSchedulingClass=best-effort
        IOSchedulingPriority=7
        """
    )


def render_prune_timer(calendar: str) -> str:
    return textwrap.dedent(
        f"""\
        [Unit]
        Description=Schedule notebooks restic prune

        [Timer]
        OnCalendar={calendar}
        Persistent=true

        [Install]
        WantedBy=timers.target
        """
    )


def command_list_drives(args: argparse.Namespace) -> None:
    candidates = get_drive_candidates(args.host)
    print_drive_table(candidates, args.host)


def command_select_drive(args: argparse.Namespace) -> None:
    config = load_config()
    candidates = get_drive_candidates(args.host)
    print_drive_table(candidates, args.host)
    selected = choose_drive(candidates, args.index)
    repo_host = args.host or repository_host(config)
    repo_path = str(Path(selected["mountpoint"]) / args.repository_subdir)
    config["repository"].update(
        {
            "host": repo_host,
            "path": repo_path,
            "drive_label": selected["label"],
            "drive_uuid": selected["uuid"],
            "drive_mountpoint": selected["mountpoint"],
            "drive_device": selected["path"],
            "repository_subdir": args.repository_subdir,
        }
    )
    current_host_profile(config)
    save_config(config)
    print(f"Selected drive {selected['mountpoint']} on {repo_host}.")
    print(f"Repository will live at {repo_path}.")


def command_show_config(_: argparse.Namespace) -> None:
    config = load_config()
    print(json.dumps(config, indent=2, sort_keys=True))


def command_set_sources(args: argparse.Namespace) -> None:
    config = load_config()
    profile = current_host_profile(config)
    if args.source:
        profile["sources"] = [str(Path(path).expanduser()) for path in args.source]
    if args.exclude:
        profile["excludes"] = list(args.exclude)
    save_config(config)
    print(f"Updated backup source profile for {current_host()}.")


def command_init_repo(_: argparse.Namespace) -> None:
    config = load_config()
    ensure_restic()
    ensure_repository_directory(config)
    if repository_exists(config):
        print(f"Repository already exists at {repository_spec(config)}.")
        return
    run_command(["restic", "init"], env=restic_env(config))
    print(f"Initialized restic repository at {repository_spec(config)}.")


def command_backup(args: argparse.Namespace) -> None:
    config = load_config()
    ensure_restic()
    profile = current_host_profile(config)
    save_config(config)
    sources = [str(Path(path).expanduser()) for path in profile["sources"]]
    if not sources:
        fail("No source paths are configured for this host.")
    command = [
        "restic",
        "backup",
        "--host",
        current_host(),
        "--tag",
        DEFAULT_BACKUP_TAG,
    ]
    for exclude in profile.get("excludes", []):
        command.extend(["--exclude", exclude])
    command.extend(sources)
    run_command(command, env=restic_env(config))
    print(f"Backup completed for {current_host()} to {repository_spec(config)}.")


def command_snapshots(args: argparse.Namespace) -> None:
    config = load_config()
    ensure_restic()
    command = ["restic", "snapshots"]
    if args.host_name:
        command.extend(["--host", args.host_name])
    result = run_command(command, env=restic_env(config))
    print(result.stdout, end="")


def command_restore(args: argparse.Namespace) -> None:
    config = load_config()
    ensure_restic()
    host_name = args.host_name or current_host()
    snapshot = resolve_snapshot(config, args.snapshot, host_name)
    target = Path(args.target).expanduser()
    target.mkdir(parents=True, exist_ok=True)
    command = ["restic", "restore", snapshot, "--target", str(target)]
    if host_name:
        command.extend(["--host", host_name])
    for include in args.include:
        command.extend(["--include", include])
    run_command(command, env=restic_env(config))
    print(f"Restored snapshot {snapshot} into {target}.")


def command_prune(_: argparse.Namespace) -> None:
    config = load_config()
    ensure_restic()
    retention = config.get("retention", {})
    command = [
        "restic",
        "forget",
        "--prune",
        "--keep-daily",
        str(retention.get("keep_daily", DEFAULT_KEEP_DAILY)),
        "--keep-weekly",
        str(retention.get("keep_weekly", DEFAULT_KEEP_WEEKLY)),
        "--keep-monthly",
        str(retention.get("keep_monthly", DEFAULT_KEEP_MONTHLY)),
    ]
    run_command(command, env=restic_env(config))
    print("Prune completed.")


def command_install_systemd(args: argparse.Namespace) -> None:
    config = load_config()
    ensure_restic()
    host_name = current_host()
    backup_calendar = args.backup_calendar or config["schedule"].get(
        "backup_calendar",
        default_backup_calendar(host_name),
    )
    prune_calendar = args.prune_calendar or config["schedule"].get(
        "prune_calendar",
        default_prune_calendar(host_name),
    )
    config["schedule"].update(
        {
            "backup_calendar": backup_calendar,
            "prune_calendar": prune_calendar,
        }
    )
    save_config(config)

    systemd_user = Path.home() / ".config" / "systemd" / "user"
    script_path = Path(__file__).resolve()
    write_unit(systemd_user / "notebooks-backup.service", render_backup_service(script_path))
    write_unit(systemd_user / "notebooks-backup.timer", render_backup_timer(backup_calendar))
    write_unit(systemd_user / "notebooks-backup-prune.service", render_prune_service(script_path))
    write_unit(systemd_user / "notebooks-backup-prune.timer", render_prune_timer(prune_calendar))

    run_command(["systemctl", "--user", "daemon-reload"])
    if not args.no_enable:
        run_command(
            [
                "systemctl",
                "--user",
                "enable",
                "--now",
                "notebooks-backup.timer",
                "notebooks-backup-prune.timer",
            ]
        )

    print("Installed user systemd backup units:")
    print(f"  notebooks-backup.timer -> {backup_calendar}")
    print(f"  notebooks-backup-prune.timer -> {prune_calendar}")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Manage shared LAN backups for me@home and me@p48 with restic.",
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    list_drives = subparsers.add_parser("list-drives", help="List mounted drives by free space.")
    list_drives.add_argument("--host", help="SSH host that can see the candidate backup drives.")
    list_drives.set_defaults(func=command_list_drives)

    select_drive = subparsers.add_parser(
        "select-drive",
        help="Choose and remember the shared repository drive.",
    )
    select_drive.add_argument("--host", help="SSH host that will physically host the drive.")
    select_drive.add_argument("--index", type=int, help="Drive number from list-drives output.")
    select_drive.add_argument(
        "--repository-subdir",
        default=DEFAULT_REPOSITORY_SUBDIR,
        help="Subdirectory to create on the selected drive.",
    )
    select_drive.set_defaults(func=command_select_drive)

    show_config = subparsers.add_parser("show-config", help="Show the saved backup config.")
    show_config.set_defaults(func=command_show_config)

    set_sources = subparsers.add_parser("set-sources", help="Override source paths for this host.")
    set_sources.add_argument(
        "--source",
        action="append",
        help="Path to include in this host's backup set. Repeat as needed.",
    )
    set_sources.add_argument(
        "--exclude",
        action="append",
        help="Exclude pattern for restic. Repeat as needed.",
    )
    set_sources.set_defaults(func=command_set_sources)

    init_repo = subparsers.add_parser("init-repo", help="Create the shared restic repository.")
    init_repo.set_defaults(func=command_init_repo)

    backup = subparsers.add_parser("backup", help="Run a backup for the current machine.")
    backup.set_defaults(func=command_backup)

    snapshots = subparsers.add_parser("snapshots", help="List snapshots in the repository.")
    snapshots.add_argument("--host-name", help="Filter snapshots by host.")
    snapshots.set_defaults(func=command_snapshots)

    restore = subparsers.add_parser("restore", help="Restore files from a snapshot.")
    restore.add_argument("--snapshot", default="latest", help="Snapshot ID or 'latest'.")
    restore.add_argument(
        "--host-name",
        help="Restore a snapshot for a specific host. Defaults to the current host.",
    )
    restore.add_argument(
        "--target",
        default=str(Path.home() / "restic-restore"),
        help="Directory to restore into.",
    )
    restore.add_argument(
        "--include",
        action="append",
        default=[],
        help="Restrict restore to specific files or directories.",
    )
    restore.set_defaults(func=command_restore)

    prune = subparsers.add_parser("prune", help="Apply retention and prune old snapshots.")
    prune.set_defaults(func=command_prune)

    install_systemd = subparsers.add_parser(
        "install-systemd",
        help="Install user-level systemd timers for automatic backup and prune.",
    )
    install_systemd.add_argument("--backup-calendar", help="systemd OnCalendar value for backups.")
    install_systemd.add_argument("--prune-calendar", help="systemd OnCalendar value for prune.")
    install_systemd.add_argument(
        "--no-enable",
        action="store_true",
        help="Write the unit files without enabling the timers.",
    )
    install_systemd.set_defaults(func=command_install_systemd)

    return parser


def main() -> None:
    parser = build_parser()
    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
