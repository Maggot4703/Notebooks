import unittest

from Crew.file_utils import read_csv_builtin, read_csv_pandas, read_excel, read_file


class TestErrorHandling(unittest.TestCase):
    def test_read_file_not_found(self):
        self.assertIsNone(read_file("nonexistent.txt"))

    def test_read_csv_builtin_not_found(self):
        self.assertEqual(read_csv_builtin("nonexistent.csv"), [])

    def test_read_csv_pandas_not_found(self):
        self.assertIsNone(read_csv_pandas("nonexistent.csv"))

    def test_read_excel_not_found(self):
        self.assertIsNone(read_excel("nonexistent.xlsx"))

    def test_read_csv_builtin_invalid(self):
        # Should handle invalid file gracefully
        self.assertEqual(read_csv_builtin("/dev/null"), [])


if __name__ == "__main__":
    unittest.main()
