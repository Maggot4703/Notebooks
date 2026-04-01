#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mount.ntfs.txt
which mount.ntfs >>./HelpMan/mount.ntfs.txt
whatis mount.ntfs >>./HelpMan/mount.ntfs.txt
mount.ntfs --help >>./HelpMan/mount.ntfs.txt
man mount.ntfs >>./HelpMan/mount.ntfs.txt
