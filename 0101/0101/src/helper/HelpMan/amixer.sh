#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/amixer.txt
which amixer >>./HelpMan/amixer.txt
whatis amixer >>./HelpMan/amixer.txt
amixer --help >>./HelpMan/amixer.txt
man amixer >>./HelpMan/amixer.txt
