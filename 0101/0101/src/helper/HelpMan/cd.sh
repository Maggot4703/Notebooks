#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cd.txt
which cd >>./HelpMan/cd.txt
whatis cd >>./HelpMan/cd.txt
cd --help >>./HelpMan/cd.txt
man cd >>./HelpMan/cd.txt
