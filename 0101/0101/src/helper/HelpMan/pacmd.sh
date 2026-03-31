#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pacmd.txt
which pacmd >>./HelpMan/pacmd.txt
whatis pacmd >>./HelpMan/pacmd.txt
pacmd --help >>./HelpMan/pacmd.txt
man pacmd >>./HelpMan/pacmd.txt
