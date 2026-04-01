#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gtbl.txt
which gtbl >>./HelpMan/gtbl.txt
whatis gtbl >>./HelpMan/gtbl.txt
gtbl --help >>./HelpMan/gtbl.txt
man gtbl >>./HelpMan/gtbl.txt
