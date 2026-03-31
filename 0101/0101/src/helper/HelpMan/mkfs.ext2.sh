#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkfs.ext2.txt
which mkfs.ext2 >>./HelpMan/mkfs.ext2.txt
whatis mkfs.ext2 >>./HelpMan/mkfs.ext2.txt
mkfs.ext2 --help >>./HelpMan/mkfs.ext2.txt
man mkfs.ext2 >>./HelpMan/mkfs.ext2.txt
