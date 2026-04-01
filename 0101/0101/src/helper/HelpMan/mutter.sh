#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mutter.txt
which mutter >>./HelpMan/mutter.txt
whatis mutter >>./HelpMan/mutter.txt
mutter --help >>./HelpMan/mutter.txt
man mutter >>./HelpMan/mutter.txt
