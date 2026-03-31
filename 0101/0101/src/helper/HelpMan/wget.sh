#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/wget.txt
which wget >>./HelpMan/wget.txt
whatis wget >>./HelpMan/wget.txt
wget --help >>./HelpMan/wget.txt
man wget >>./HelpMan/wget.txt
