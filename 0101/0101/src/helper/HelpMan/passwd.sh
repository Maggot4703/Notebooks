#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/passwd.txt
which passwd >>./HelpMan/passwd.txt
whatis passwd >>./HelpMan/passwd.txt
passwd --help >>./HelpMan/passwd.txt
man passwd >>./HelpMan/passwd.txt
