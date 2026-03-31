#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/alsactl.txt
which alsactl >>./HelpMan/alsactl.txt
whatis alsactl >>./HelpMan/alsactl.txt
alsactl --help >>./HelpMan/alsactl.txt
man alsactl >>./HelpMan/alsactl.txt
