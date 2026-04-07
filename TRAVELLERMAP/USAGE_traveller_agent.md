# Usage examples for traveller_agent

from traveller_agent import traveller_agent

# List all available skills/scripts
print(traveller_agent.list_skills())

# Get documentation for a skill
print(traveller_agent.get_doc('find-nearest-base-to'))

# Run a skill as a callable (if the script exposes a function with the same name)
# Example: result = traveller_agent.run('find-nearest-base-to', 'Vland.tab', 'Jewell', 'Navy')

# If the script only exposes main(), you can still call it with arguments
# Example: result = traveller_agent.run('export-image', 'Vland.tab', 'output.png')
