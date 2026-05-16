#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/uname.txt
which uname >>./HelpMan/uname.txt
whatis uname >>./HelpMan/uname.txt
uname --help >>./HelpMan/uname.txt
man uname >>./HelpMan/uname.txt
