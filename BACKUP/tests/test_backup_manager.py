from __future__ import annotations

import tempfile
import unittest
from pathlib import Path
from unittest import mock

import backup_manager


class BackupManagerTests(unittest.TestCase):
    def test_parse_df_output(self) -> None:
        output = """Filesystem 1B-blocks Used Available Use% Mounted on
/dev/sda1 1000 250 750 25% /
/dev/sdb1 4000 1000 3000 25% /media/me/BIG
"""
        parsed = backup_manager.parse_df_output(output)
        self.assertEqual(parsed["/"]["available"], 750)
        self.assertEqual(parsed["/media/me/BIG"]["size"], 4000)

    def test_get_drive_candidates_prefers_largest_free_space(self) -> None:
        lsblk_data = {
            "blockdevices": [
                {
                    "path": "/dev/sda1",
                    "fstype": "ext4",
                    "label": "ROOT",
                    "uuid": "uuid-root",
                    "mountpoints": ["/"],
                    "ro": False,
                    "rm": False,
                    "hotplug": False,
                    "tran": "",
                },
                {
                    "path": "/dev/sdb1",
                    "fstype": "ext4",
                    "label": "BACKUP",
                    "uuid": "uuid-backup",
                    "mountpoints": ["/media/me/BACKUP"],
                    "ro": False,
                    "rm": True,
                    "hotplug": True,
                    "tran": "usb",
                },
            ]
        }
        usage = {
            "/": {"size": 1000, "available": 500},
            "/media/me/BACKUP": {"size": 10_000, "available": 9_500},
        }
        with (
            mock.patch.object(backup_manager, "get_lsblk_data", return_value=lsblk_data),
            mock.patch.object(backup_manager, "get_df_usage", return_value=usage),
        ):
            candidates = backup_manager.get_drive_candidates(None)
        self.assertEqual(candidates[0]["mountpoint"], "/media/me/BACKUP")
        self.assertTrue(candidates[0]["removable"])

    def test_default_sources_only_include_existing_paths(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            fake_home = Path(temp_dir)
            (fake_home / "Notebooks").mkdir()
            (fake_home / "Documents").mkdir()
            with mock.patch("backup_manager.Path.home", return_value=fake_home):
                sources = backup_manager.default_sources()
        self.assertEqual(sources, [fake_home / "Notebooks", fake_home / "Documents"])

    def test_render_backup_timer_contains_calendar(self) -> None:
        timer = backup_manager.render_backup_timer("*-*-* 03:15:00")
        self.assertIn("OnCalendar=*-*-* 03:15:00", timer)
        self.assertIn("Persistent=true", timer)


if __name__ == "__main__":
    unittest.main()
