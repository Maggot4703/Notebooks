"""
Test suite for DataManager module (data_manager.py).
Covers core data loading, filtering, sorting, and observer notification.
"""

import os
import sys
import unittest

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
from Crew.data_manager import DataManager, FilterConfig


class TestDataManager(unittest.TestCase):
    def setUp(self):
        self.manager = DataManager()
        self.sample_data = [
            ["Alice", "Engineer", 30],
            ["Bob", "Manager", 40],
            ["Charlie", "Technician", 25],
        ]
        self.headers = ["Name", "Role", "Age"]

    def test_load_data_valid(self):
        result = self.manager.load_data(self.sample_data, self.headers)
        self.assertTrue(result)
        self.assertEqual(self.manager._state.raw_data, self.sample_data)
        self.assertEqual(self.manager._state.headers, self.headers)

    def test_register_and_notify_observer(self):
        calls = []

        def observer(state):
            calls.append(state)

        self.manager.register_observer(observer)
        self.manager._notify_observers()
        self.assertTrue(len(calls) > 0)

    def test_load_data_invalid_structure(self):
        # Mismatched row length
        bad_data = [["Alice", "Engineer"], ["Bob", "Manager", 40]]
        result = self.manager.load_data(bad_data, self.headers)
        self.assertTrue(result)

    def test_apply_filter_text(self):
        self.manager.load_data(self.sample_data, self.headers)
        # Filter for 'Alice'
        filtered = self.manager.apply_filter(
            FilterConfig(text="Alice", column="All Columns")
        )
        self.assertTrue(any("Alice" in row for row in filtered))

    def test_apply_filter_empty(self):
        self.manager.load_data(self.sample_data, self.headers)
        # Empty filter returns all data
        filtered = self.manager.apply_filter(
            FilterConfig(text="", column="All Columns")
        )
        self.assertEqual(filtered, self.sample_data)

    def test_load_data_from_file_not_found(self):
        with self.assertRaises(FileNotFoundError):
            self.manager.load_data_from_file("nonexistent_file.csv")

    def test_load_data_from_file_unsupported_extension(self):
        import tempfile

        with tempfile.NamedTemporaryFile(suffix=".unsupported", delete=True) as tmp:
            tmp.write(b"dummy data")
            tmp.flush()
            with self.assertRaises(ValueError):
                self.manager.load_data_from_file(tmp.name)

    def test_save_data_to_file_and_reload(self):
        import tempfile

        self.manager.load_data(self.sample_data, self.headers)
        with tempfile.NamedTemporaryFile(suffix=".csv", delete=False) as tmp:
            tmp.close()
            result = self.manager.save_data_to_file(tmp.name)
            self.assertTrue(result)
            # Now reload
            loaded, headers = self.manager.load_data_from_file(tmp.name)
            self.assertEqual(headers, self.headers)
        os.remove(tmp.name)


if __name__ == "__main__":
    unittest.main()
