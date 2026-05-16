#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x11perfcomp.txt
which x11perfcomp >>./HelpMan/x11perfcomp.txt
whatis x11perfcomp >>./HelpMan/x11perfcomp.txt
x11perfcomp --help >>./HelpMan/x11perfcomp.txt
man x11perfcomp >>./HelpMan/x11perfcomp.txt
