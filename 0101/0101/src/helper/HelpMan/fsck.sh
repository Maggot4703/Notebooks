#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fsck.txt
which fsck >>./HelpMan/fsck.txt
whatis fsck >>./HelpMan/fsck.txt
fsck --help >>./HelpMan/fsck.txt
man fsck >>./HelpMan/fsck.txt
