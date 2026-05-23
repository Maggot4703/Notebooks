#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fsck.ext4.txt
which fsck.ext4 >>./HelpMan/fsck.ext4.txt
whatis fsck.ext4 >>./HelpMan/fsck.ext4.txt
fsck.ext4 --help >>./HelpMan/fsck.ext4.txt
man fsck.ext4 >>./HelpMan/fsck.ext4.txt
