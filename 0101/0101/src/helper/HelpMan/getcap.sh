#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/getcap.txt
which getcap >>./HelpMan/getcap.txt
whatis getcap >>./HelpMan/getcap.txt
getcap --help >>./HelpMan/getcap.txt
man getcap >>./HelpMan/getcap.txt
