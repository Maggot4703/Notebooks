#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fsck.ext2.txt
which fsck.ext2 >>./HelpMan/fsck.ext2.txt
whatis fsck.ext2 >>./HelpMan/fsck.ext2.txt
fsck.ext2 --help >>./HelpMan/fsck.ext2.txt
man fsck.ext2 >>./HelpMan/fsck.ext2.txt
