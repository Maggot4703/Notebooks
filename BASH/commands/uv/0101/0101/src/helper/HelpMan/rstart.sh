#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rstart.txt
which rstart >>./HelpMan/rstart.txt
whatis rstart >>./HelpMan/rstart.txt
rstart --help >>./HelpMan/rstart.txt
man rstart >>./HelpMan/rstart.txt
