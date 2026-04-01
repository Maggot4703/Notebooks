#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fc-pattern.txt
which fc-pattern >>./HelpMan/fc-pattern.txt
whatis fc-pattern >>./HelpMan/fc-pattern.txt
fc-pattern --help >>./HelpMan/fc-pattern.txt
man fc-pattern >>./HelpMan/fc-pattern.txt
