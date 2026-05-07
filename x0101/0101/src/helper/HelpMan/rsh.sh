#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rsh.txt
which rsh >>./HelpMan/rsh.txt
whatis rsh >>./HelpMan/rsh.txt
rsh --help >>./HelpMan/rsh.txt
man rsh >>./HelpMan/rsh.txt
