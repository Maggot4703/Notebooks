#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/localectl.txt
which localectl >>./HelpMan/localectl.txt
whatis localectl >>./HelpMan/localectl.txt
localectl --help >>./HelpMan/localectl.txt
man localectl >>./HelpMan/localectl.txt
