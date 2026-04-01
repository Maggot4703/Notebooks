#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/remmina.txt
which remmina >>./HelpMan/remmina.txt
whatis remmina >>./HelpMan/remmina.txt
remmina --help >>./HelpMan/remmina.txt
man remmina >>./HelpMan/remmina.txt
