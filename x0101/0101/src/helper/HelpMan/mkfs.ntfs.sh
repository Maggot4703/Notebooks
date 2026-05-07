#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkfs.ntfs.txt
which mkfs.ntfs >>./HelpMan/mkfs.ntfs.txt
whatis mkfs.ntfs >>./HelpMan/mkfs.ntfs.txt
mkfs.ntfs --help >>./HelpMan/mkfs.ntfs.txt
man mkfs.ntfs >>./HelpMan/mkfs.ntfs.txt
