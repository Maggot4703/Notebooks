# Plan: Full Disk Backup of me@p48 to /home/me/BACKUP/p48

## Goal
Create a complete disk image backup of the entire main disk on me@p48 and store it as a compressed image in /home/me/BACKUP/p48 on the local machine.

## Steps
1. **Identify the correct disk device on me@p48**
   - Commonly /dev/mmcblk0 (SD card) or /dev/sda (USB drive).
   - Run `lsblk` or `sudo fdisk -l` on me@p48 to confirm.

2. **Prepare the local backup directory**
   - Ensure /home/me/BACKUP/p48 exists and has enough free space for the image.

3. **Run the disk imaging command from the local machine**
   - Use SSH to run dd on me@p48, stream the output, and compress it on the fly:

   ```bash
   ssh me@p48 "sudo dd if=/dev/mmcblk0 bs=4M | gzip -" | dd of=/home/me/BACKUP/p48/p48_disk.img.gz bs=4M
   ```
   - Replace `/dev/mmcblk0` with the correct device if needed.
   - This creates a compressed disk image at `/home/me/BACKUP/p48/p48_disk.img.gz`.

4. **Monitor progress**
   - Add `status=progress` to dd for progress output (if supported):
   ```bash
   ssh me@p48 "sudo dd if=/dev/mmcblk0 bs=4M status=progress | gzip -" | dd of=/home/me/BACKUP/p48/p48_disk.img.gz bs=4M status=progress
   ```

5. **Verify the backup**
   - Check the file size and optionally test decompression:
   ```bash
   gunzip -c /home/me/BACKUP/p48/p48_disk.img.gz | dd of=/dev/null bs=4M status=progress
   ```

## Notes
- This method requires root (sudo) on me@p48.
- The backup file will be as large as the used space on the disk (compressed).
- To restore, reverse the process:
   ```bash
   gunzip -c /home/me/BACKUP/p48/p48_disk.img.gz | ssh me@p48 "sudo dd of=/dev/mmcblk0 bs=4M"
   ```
- Ensure no critical processes are running on me@p48 during backup/restore.
- For live systems, consider using fsfreeze or LVM snapshots for consistency.
