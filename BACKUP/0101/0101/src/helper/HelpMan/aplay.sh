#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aplay.txt
which aplay >>./HelpMan/aplay.txt
whatis aplay >>./HelpMan/aplay.txt
aplay --help >>./HelpMan/aplay.txt
man aplay >>./HelpMan/aplay.txt
