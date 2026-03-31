#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pftp.txt
which pftp >>./HelpMan/pftp.txt
whatis pftp >>./HelpMan/pftp.txt
pftp --help >>./HelpMan/pftp.txt
man pftp >>./HelpMan/pftp.txt
