#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ipmaddr.txt
which ipmaddr >>./HelpMan/ipmaddr.txt
whatis ipmaddr >>./HelpMan/ipmaddr.txt
ipmaddr --help >>./HelpMan/ipmaddr.txt
man ipmaddr >>./HelpMan/ipmaddr.txt
