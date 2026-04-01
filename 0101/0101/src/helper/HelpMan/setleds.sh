#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/setleds.txt
which setleds >>./HelpMan/setleds.txt
whatis setleds >>./HelpMan/setleds.txt
setleds --help >>./HelpMan/setleds.txt
man setleds >>./HelpMan/setleds.txt
