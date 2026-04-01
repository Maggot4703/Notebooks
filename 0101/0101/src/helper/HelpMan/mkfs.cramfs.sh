#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkfs.cramfs.txt
which mkfs.cramfs >>./HelpMan/mkfs.cramfs.txt
whatis mkfs.cramfs >>./HelpMan/mkfs.cramfs.txt
mkfs.cramfs --help >>./HelpMan/mkfs.cramfs.txt
man mkfs.cramfs >>./HelpMan/mkfs.cramfs.txt
