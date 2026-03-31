#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rtmon.txt
which rtmon >>./HelpMan/rtmon.txt
whatis rtmon >>./HelpMan/rtmon.txt
rtmon --help >>./HelpMan/rtmon.txt
man rtmon >>./HelpMan/rtmon.txt
