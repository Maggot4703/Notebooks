#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkfs.msdos.txt
which mkfs.msdos >>./HelpMan/mkfs.msdos.txt
whatis mkfs.msdos >>./HelpMan/mkfs.msdos.txt
mkfs.msdos --help >>./HelpMan/mkfs.msdos.txt
man mkfs.msdos >>./HelpMan/mkfs.msdos.txt
