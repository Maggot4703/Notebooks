#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xauth.txt
which xauth >>./HelpMan/xauth.txt
whatis xauth >>./HelpMan/xauth.txt
xauth --help >>./HelpMan/xauth.txt
man xauth >>./HelpMan/xauth.txt
