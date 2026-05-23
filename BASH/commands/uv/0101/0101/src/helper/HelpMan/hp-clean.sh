#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-clean.txt
which hp-clean >>./HelpMan/hp-clean.txt
whatis hp-clean >>./HelpMan/hp-clean.txt
hp-clean --help >>./HelpMan/hp-clean.txt
man hp-clean >>./HelpMan/hp-clean.txt
