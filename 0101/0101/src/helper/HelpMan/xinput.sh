#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xinput.txt
which xinput >>./HelpMan/xinput.txt
whatis xinput >>./HelpMan/xinput.txt
xinput --help >>./HelpMan/xinput.txt
man xinput >>./HelpMan/xinput.txt
