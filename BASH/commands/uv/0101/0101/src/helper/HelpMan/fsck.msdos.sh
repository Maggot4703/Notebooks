#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fsck.msdos.txt
which fsck.msdos >>./HelpMan/fsck.msdos.txt
whatis fsck.msdos >>./HelpMan/fsck.msdos.txt
fsck.msdos --help >>./HelpMan/fsck.msdos.txt
man fsck.msdos >>./HelpMan/fsck.msdos.txt
