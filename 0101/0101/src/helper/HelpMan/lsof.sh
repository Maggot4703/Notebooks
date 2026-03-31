#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lsof.txt
which lsof >>./HelpMan/lsof.txt
whatis lsof >>./HelpMan/lsof.txt
lsof --help >>./HelpMan/lsof.txt
man lsof >>./HelpMan/lsof.txt
