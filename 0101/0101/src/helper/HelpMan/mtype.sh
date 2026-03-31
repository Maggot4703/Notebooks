#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mtype.txt
which mtype >>./HelpMan/mtype.txt
whatis mtype >>./HelpMan/mtype.txt
mtype --help >>./HelpMan/mtype.txt
man mtype >>./HelpMan/mtype.txt
