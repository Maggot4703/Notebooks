import os
import sys
import unittest

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
import logic


class TestLogic(unittest.TestCase):
    def test_perform_logic_exists(self):
        self.assertTrue(hasattr(logic, "perform_logic"))
        logic.perform_logic()  # Should not raise


if __name__ == "__main__":
    unittest.main()
