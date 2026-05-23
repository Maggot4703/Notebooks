#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ld.txt
which ld >>./HelpMan/ld.txt
whatis ld >>./HelpMan/ld.txt
ld --help >>./HelpMan/ld.txt
man ld >>./HelpMan/ld.txt
