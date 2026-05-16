import unittest
import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))


class TestEdgeCases(unittest.TestCase):
    def test_load_empty_data(self):
        from data_manager import DataManager

        manager = DataManager()
        data = []
        headers = []
        result = manager.load_data(data, headers)
        self.assertTrue(result)

    def test_load_malformed_data(self):
        from data_manager import DataManager

        manager = DataManager()
        data = [None, 123, "bad"]
        headers = ["A"]
        result = manager.load_data(data, headers)
        self.assertFalse(result)

    def test_load_large_data(self):
        from data_manager import DataManager

        manager = DataManager()
        data = [[str(i)] for i in range(100000)]
        headers = ["Col1"]
        result = manager.load_data(data, headers)
        self.assertTrue(result)


class TestErrorHandling(unittest.TestCase):
    def test_database_manager_file_not_found(self):
        from database_manager import DatabaseManager

        db = DatabaseManager("nonexistent_db.db")
        with self.assertRaises(FileNotFoundError):
            db.load_data("nonexistent_file.txt")


# More test classes for GUI, dependency, multi-user, integration, and performance can be added similarly.

if __name__ == "__main__":
    unittest.main()
