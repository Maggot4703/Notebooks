#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mcomp.txt
which mcomp >>./HelpMan/mcomp.txt
whatis mcomp >>./HelpMan/mcomp.txt
mcomp --help >>./HelpMan/mcomp.txt
man mcomp >>./HelpMan/mcomp.txt
