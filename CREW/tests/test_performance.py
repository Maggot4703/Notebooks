import tempfile
import time
import unittest

from Crew.file_utils import read_csv_builtin, save_file


class TestPerformance(unittest.TestCase):
    def test_large_csv_read_write(self):
        # Generate a large dataset
        rows = [[f"col{i}" for i in range(20)]]
        for r in range(10000):
            rows.append([str(r * i) for i in range(20)])
        with tempfile.NamedTemporaryFile(suffix=".csv", delete=False) as tf:
            save_file(tf.name, rows)
            start = time.time()
            loaded = read_csv_builtin(tf.name)
            elapsed = time.time() - start
        self.assertEqual(loaded[0], rows[0])
        self.assertLess(elapsed, 2.0)  # Should load in under 2 seconds


if __name__ == "__main__":
    unittest.main()
