#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/zegrep.txt
which zegrep >>./HelpMan/zegrep.txt
whatis zegrep >>./HelpMan/zegrep.txt
zegrep --help >>./HelpMan/zegrep.txt
man zegrep >>./HelpMan/zegrep.txt
