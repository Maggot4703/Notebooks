import os
from datetime import datetime

def save_chat_log(chat_text, directory=None):
    """
    Save chat log to /home/me/Notebooks/CREW/DESIGN/chats with a timestamped filename.
    """
    if directory is None:
        directory = '/home/me/Notebooks/CREW/DESIGN/chats'
    os.makedirs(directory, exist_ok=True)
    timestamp = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
    filename = f'chat-{timestamp}.md'
    path = os.path.join(directory, filename)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(chat_text)
    print(f"Chat saved to {path}")
    return path

# Example usage:
# chat_content = "Your chat log here..."
# save_chat_log(chat_content)
