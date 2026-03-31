#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkfs.fat.txt
which mkfs.fat >>./HelpMan/mkfs.fat.txt
whatis mkfs.fat >>./HelpMan/mkfs.fat.txt
mkfs.fat --help >>./HelpMan/mkfs.fat.txt
man mkfs.fat >>./HelpMan/mkfs.fat.txt
