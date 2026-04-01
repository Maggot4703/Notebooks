#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-info.txt
which hp-info >>./HelpMan/hp-info.txt
whatis hp-info >>./HelpMan/hp-info.txt
hp-info --help >>./HelpMan/hp-info.txt
man hp-info >>./HelpMan/hp-info.txt
