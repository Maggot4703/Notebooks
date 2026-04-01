#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xkbprint.txt
which xkbprint >>./HelpMan/xkbprint.txt
whatis xkbprint >>./HelpMan/xkbprint.txt
xkbprint --help >>./HelpMan/xkbprint.txt
man xkbprint >>./HelpMan/xkbprint.txt
