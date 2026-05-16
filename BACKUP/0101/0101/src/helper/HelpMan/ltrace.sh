#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ltrace.txt
which ltrace >>./HelpMan/ltrace.txt
whatis ltrace >>./HelpMan/ltrace.txt
ltrace --help >>./HelpMan/ltrace.txt
man ltrace >>./HelpMan/ltrace.txt
