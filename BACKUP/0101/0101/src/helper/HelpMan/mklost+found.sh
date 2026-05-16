#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mklost+found.txt
which mklost+found >>./HelpMan/mklost+found.txt
whatis mklost+found >>./HelpMan/mklost+found.txt
mklost+found --help >>./HelpMan/mklost+found.txt
man mklost+found >>./HelpMan/mklost+found.txt
