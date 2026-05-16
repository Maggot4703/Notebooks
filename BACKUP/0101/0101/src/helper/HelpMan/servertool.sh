#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/servertool.txt
which servertool >>./HelpMan/servertool.txt
whatis servertool >>./HelpMan/servertool.txt
servertool --help >>./HelpMan/servertool.txt
man servertool >>./HelpMan/servertool.txt
