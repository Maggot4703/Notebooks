# plan_15_gui_enhancements_code.py
import tkinter as tk
from tkinter import ttk

def show_assignment_dashboard(assignments):
    root = tk.Tk()
    root.title('Crew Assignment Dashboard')
    tree = ttk.Treeview(root, columns=('Role', 'Agent'), show='headings')
    tree.heading('Role', text='Role')
    tree.heading('Agent', text='Agent')
    for role, agent in assignments.items():
        tree.insert('', 'end', values=(role, agent))
    tree.pack(fill='both', expand=True)
    root.mainloop()

# Example usage:
# assignments = {'Pilot': 'John Doe', 'Medic': 'Jane Smith'}
# show_assignment_dashboard(assignments)
