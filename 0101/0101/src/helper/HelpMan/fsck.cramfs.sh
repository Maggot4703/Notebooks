#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fsck.cramfs.txt
which fsck.cramfs >>./HelpMan/fsck.cramfs.txt
whatis fsck.cramfs >>./HelpMan/fsck.cramfs.txt
fsck.cramfs --help >>./HelpMan/fsck.cramfs.txt
man fsck.cramfs >>./HelpMan/fsck.cramfs.txt
