#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/runcon.txt
which runcon >>./HelpMan/runcon.txt
whatis runcon >>./HelpMan/runcon.txt
runcon --help >>./HelpMan/runcon.txt
man runcon >>./HelpMan/runcon.txt
