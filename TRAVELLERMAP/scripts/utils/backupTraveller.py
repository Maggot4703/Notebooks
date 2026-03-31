import os
import shutil

# Settings
search_names = {"t5", "traveller", "pdfs"}
destination_root = "/media/me/Traveller"

def is_match(name):
    return name.lower() in search_names

def get_mounted_drives():
    # List all /media/me/* and /mnt/* as candidate drives
    drives = []
    for base in ["/media/me", "/mnt"]:
        if os.path.exists(base):
            for entry in os.listdir(base):
                drives.append(os.path.join(base, entry))
    return [d for d in drives if os.path.isdir(d)]

def find_relevant_folders(drive):
    matches = []
    for root, dirs, files in os.walk(drive):
        for d in dirs:
            if is_match(d):
                matches.append(os.path.join(root, d))
    return matches

def copy_folder(src, dst):
    if not os.path.exists(dst):
        os.makedirs(dst)
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            shutil.copytree(s, d, dirs_exist_ok=True)
        else:
            shutil.copy2(s, d)
def get_total_size(folders):
    total = 0
    for folder in folders:
        for root, dirs, files in os.walk(folder):
            for f in files:
                fp = os.path.join(root, f)
                if os.path.isfile(fp):
                    total += os.path.getsize(fp)
    return total

def write_html_listing(files, html_path, folder_label=None):
    with open(html_path, "w", encoding="utf-8") as f:
        f.write("<html><head><title>Traveller Files Not Copied</title></head><body>\n")
        if folder_label:
            f.write(f"<h2>Folder: {folder_label}</h2>\n")
        f.write("<h1>Traveller Files NOT COPIED (Insufficient Disk Space)</h1>\n")
        f.write("<ul>\n")
        for file in files:
            f.write(f"<li>{file}</li>\n")
        f.write("</ul>\n</body></html>\n")

def safe_html_filename(folder_path):
    # Replace slashes and problematic chars with underscores, remove leading slashes
    import re
    fname = re.sub(r'[^A-Za-z0-9._-]', '_', folder_path.strip('/'))
    return f"not_copied_{fname}.html"

def main():
    if not os.path.exists(destination_root):
        os.makedirs(destination_root)
    drives = get_mounted_drives()
    all_found = []
    for drive in drives:
        all_found.extend(find_relevant_folders(drive))
    usage = shutil.disk_usage(destination_root)
    print(f"Free space on backup: {usage.free/1e9:.2f} GB")
    for folder in all_found:
        # Calculate size for this folder
        folder_files = []
        folder_size = 0
        for root, dirs, files in os.walk(folder):
            for f in files:
                fp = os.path.join(root, f)
                if os.path.isfile(fp):
                    folder_files.append(fp)
                    folder_size += os.path.getsize(fp)
        usage = shutil.disk_usage(destination_root)
        if folder_size > usage.free:
            print(f"Not enough space for folder {folder}. Writing HTML listing and skipping.")
            html_path = os.path.join(destination_root, safe_html_filename(folder))
            write_html_listing(folder_files, html_path, folder_label=folder)
            print(f"HTML listing written to {html_path}")
            continue
        drive_name = os.path.basename(os.path.dirname(folder))
        folder_name = os.path.basename(folder)
        dest = os.path.join(destination_root, f"{drive_name}_{folder_name}")
        print(f"Copying from {folder} to {dest}")
        copy_folder(folder, dest)

if __name__ == "__main__":
    main()
