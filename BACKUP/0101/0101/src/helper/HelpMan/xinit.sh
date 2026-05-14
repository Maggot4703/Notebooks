#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xinit.txt
which xinit >>./HelpMan/xinit.txt
whatis xinit >>./HelpMan/xinit.txt
xinit --help >>./HelpMan/xinit.txt
man xinit >>./HelpMan/xinit.txt
