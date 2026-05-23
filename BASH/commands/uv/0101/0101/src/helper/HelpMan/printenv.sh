#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/printenv.txt
which printenv >>./HelpMan/printenv.txt
whatis printenv >>./HelpMan/printenv.txt
printenv --help >>./HelpMan/printenv.txt
man printenv >>./HelpMan/printenv.txt
