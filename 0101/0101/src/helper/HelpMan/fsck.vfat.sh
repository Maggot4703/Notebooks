#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fsck.vfat.txt
which fsck.vfat >>./HelpMan/fsck.vfat.txt
whatis fsck.vfat >>./HelpMan/fsck.vfat.txt
fsck.vfat --help >>./HelpMan/fsck.vfat.txt
man fsck.vfat >>./HelpMan/fsck.vfat.txt
