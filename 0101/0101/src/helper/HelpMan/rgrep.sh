#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rgrep.txt
which rgrep >>./HelpMan/rgrep.txt
whatis rgrep >>./HelpMan/rgrep.txt
rgrep --help >>./HelpMan/rgrep.txt
man rgrep >>./HelpMan/rgrep.txt
