#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ls.txt
which ls >>./HelpMan/ls.txt
whatis ls >>./HelpMan/ls.txt
ls --help >>./HelpMan/ls.txt
man ls >>./HelpMan/ls.txt
