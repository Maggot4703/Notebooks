#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/zipgrep.txt
which zipgrep >>./HelpMan/zipgrep.txt
whatis zipgrep >>./HelpMan/zipgrep.txt
zipgrep --help >>./HelpMan/zipgrep.txt
man zipgrep >>./HelpMan/zipgrep.txt
