#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fuser.txt
which fuser >>./HelpMan/fuser.txt
whatis fuser >>./HelpMan/fuser.txt
fuser --help >>./HelpMan/fuser.txt
man fuser >>./HelpMan/fuser.txt
