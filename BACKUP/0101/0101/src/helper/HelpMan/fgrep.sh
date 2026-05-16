#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fgrep.txt
which fgrep >>./HelpMan/fgrep.txt
whatis fgrep >>./HelpMan/fgrep.txt
fgrep --help >>./HelpMan/fgrep.txt
man fgrep >>./HelpMan/fgrep.txt
