#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/agetty.txt
which agetty >>./HelpMan/agetty.txt
whatis agetty >>./HelpMan/agetty.txt
agetty --help >>./HelpMan/agetty.txt
man agetty >>./HelpMan/agetty.txt
