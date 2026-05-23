#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-align.txt
which hp-align >>./HelpMan/hp-align.txt
whatis hp-align >>./HelpMan/hp-align.txt
hp-align --help >>./HelpMan/hp-align.txt
man hp-align >>./HelpMan/hp-align.txt
