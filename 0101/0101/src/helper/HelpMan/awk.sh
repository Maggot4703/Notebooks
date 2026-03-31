#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/awk.txt
which awk >>./HelpMan/awk.txt
whatis awk >>./HelpMan/awk.txt
awk --help >>./HelpMan/awk.txt
man awk >>./HelpMan/awk.txt
