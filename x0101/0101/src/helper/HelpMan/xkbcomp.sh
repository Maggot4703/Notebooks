#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xkbcomp.txt
which xkbcomp >>./HelpMan/xkbcomp.txt
whatis xkbcomp >>./HelpMan/xkbcomp.txt
xkbcomp --help >>./HelpMan/xkbcomp.txt
man xkbcomp >>./HelpMan/xkbcomp.txt
