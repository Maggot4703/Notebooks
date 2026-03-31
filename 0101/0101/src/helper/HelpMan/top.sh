#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/top.txt
which top >>./HelpMan/top.txt
whatis top >>./HelpMan/top.txt
top --help >>./HelpMan/top.txt
man top >>./HelpMan/top.txt
