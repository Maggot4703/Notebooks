#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fsck.minix.txt
which fsck.minix >>./HelpMan/fsck.minix.txt
whatis fsck.minix >>./HelpMan/fsck.minix.txt
fsck.minix --help >>./HelpMan/fsck.minix.txt
man fsck.minix >>./HelpMan/fsck.minix.txt
