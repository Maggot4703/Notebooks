#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xsetwacom.txt
which xsetwacom >>./HelpMan/xsetwacom.txt
whatis xsetwacom >>./HelpMan/xsetwacom.txt
xsetwacom --help >>./HelpMan/xsetwacom.txt
man xsetwacom >>./HelpMan/xsetwacom.txt
