#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mt.txt
which mt >>./HelpMan/mt.txt
whatis mt >>./HelpMan/mt.txt
mt --help >>./HelpMan/mt.txt
man mt >>./HelpMan/mt.txt
