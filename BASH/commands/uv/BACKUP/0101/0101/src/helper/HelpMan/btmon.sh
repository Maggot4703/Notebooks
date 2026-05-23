#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/btmon.txt
which btmon >>./HelpMan/btmon.txt
whatis btmon >>./HelpMan/btmon.txt
btmon --help >>./HelpMan/btmon.txt
man btmon >>./HelpMan/btmon.txt
