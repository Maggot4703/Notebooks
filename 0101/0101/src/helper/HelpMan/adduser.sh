#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/adduser.txt
which adduser >>./HelpMan/adduser.txt
whatis adduser >>./HelpMan/adduser.txt
adduser --help >>./HelpMan/adduser.txt
man adduser >>./HelpMan/adduser.txt
