#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lessfile.txt
which lessfile >>./HelpMan/lessfile.txt
whatis lessfile >>./HelpMan/lessfile.txt
lessfile --help >>./HelpMan/lessfile.txt
man lessfile >>./HelpMan/lessfile.txt
