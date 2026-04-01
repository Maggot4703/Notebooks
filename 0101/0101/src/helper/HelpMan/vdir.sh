#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/vdir.txt
which vdir >>./HelpMan/vdir.txt
whatis vdir >>./HelpMan/vdir.txt
vdir --help >>./HelpMan/vdir.txt
man vdir >>./HelpMan/vdir.txt
