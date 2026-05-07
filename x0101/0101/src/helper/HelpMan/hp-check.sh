#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-check.txt
which hp-check >>./HelpMan/hp-check.txt
whatis hp-check >>./HelpMan/hp-check.txt
hp-check --help >>./HelpMan/hp-check.txt
man hp-check >>./HelpMan/hp-check.txt
