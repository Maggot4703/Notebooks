"""
Test suite for event_manager.py (Event Manager module).
"""
import unittest
import sys, os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import event_manager

class TestEventManager(unittest.TestCase):
    def test_event_manager_initialization(self):
        class MockGUI:
            def __init__(self):
                self.root = object()
                self.clear_filter = lambda: None
                self.tts_engine = None
        gui = MockGUI()
        mgr = event_manager.EventManager(gui)
        self.assertIs(mgr.gui, gui)
        self.assertIs(mgr.root, gui.root)

    def test_setup_keyboard_shortcuts(self):
        class MockGUI:
            def __init__(self):
                self.root = object()
                self.clear_filter = lambda: None
                self.tts_engine = None
        gui = MockGUI()
        mgr = event_manager.EventManager(gui)
        # Should not raise
        mgr.setup_keyboard_shortcuts()

if __name__ == "__main__":
    unittest.main()
