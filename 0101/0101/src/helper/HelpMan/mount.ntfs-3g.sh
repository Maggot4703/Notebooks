#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mount.ntfs-3g.txt
which mount.ntfs-3g >>./HelpMan/mount.ntfs-3g.txt
whatis mount.ntfs-3g >>./HelpMan/mount.ntfs-3g.txt
mount.ntfs-3g --help >>./HelpMan/mount.ntfs-3g.txt
man mount.ntfs-3g >>./HelpMan/mount.ntfs-3g.txt
