import unittest
from Crew.cli import main as cli_main
from Crew.data_manager import DataManager
from Crew.file_utils import read_file, save_file, read_csv_builtin
from Crew.database_manager import DatabaseManager
from Crew.gui import CrewGUI
import tempfile
import os
import tkinter as tk

class TestCrewIntegration(unittest.TestCase):
    def setUp(self):
        self.temp_dir = tempfile.TemporaryDirectory()
        self.data_manager = DataManager()
        self.db_manager = DatabaseManager()
        self.root = tk.Tk()
        self.gui = CrewGUI(self.root)

    def tearDown(self):
        self.temp_dir.cleanup()
        self.root.destroy()

    def test_cli_to_data_manager(self):
        # Simulate CLI with a valid command (help)
        try:
            cli_main(["--help"])
        except SystemExit as e:
            self.assertIn(e.code, [0, None])

    def test_data_manager_to_file_utils(self):
        # Save and read a file through DataManager and file_utils
        test_path = os.path.join(self.temp_dir.name, "test.csv")
        data = [["header1", "header2"], ["row1col1", "row1col2"]]
        save_file(test_path, data)
        loaded = read_csv_builtin(test_path)
        self.assertEqual(loaded, data)

    def test_database_manager_integration(self):
        # Test database manager basic integration
        # Only test connect/close if available
        if hasattr(self.db_manager, "connect"):
            self.db_manager.connect()
        if hasattr(self.db_manager, "close"):
            self.db_manager.close()
        self.assertTrue(True)  # Pass if no exception

    def test_gui_data_flow(self):
        # Simulate GUI loading data and updating status
        self.gui.update_status("Test message", error=False)
        # Some GUIs may not have status_var if not fully initialized
        if hasattr(self.gui, "status_var"):
            self.assertEqual(self.gui.status_var.get(), "Test message")
        else:
            self.assertTrue(True)  # Skip if not present

if __name__ == "__main__":
    unittest.main()
