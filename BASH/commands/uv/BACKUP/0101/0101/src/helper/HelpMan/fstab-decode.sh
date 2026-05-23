#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fstab-decode.txt
which fstab-decode >>./HelpMan/fstab-decode.txt
whatis fstab-decode >>./HelpMan/fstab-decode.txt
fstab-decode --help >>./HelpMan/fstab-decode.txt
man fstab-decode >>./HelpMan/fstab-decode.txt
