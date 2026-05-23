#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-levels.txt
which hp-levels >>./HelpMan/hp-levels.txt
whatis hp-levels >>./HelpMan/hp-levels.txt
hp-levels --help >>./HelpMan/hp-levels.txt
man hp-levels >>./HelpMan/hp-levels.txt
