#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pathchk.txt
which pathchk >>./HelpMan/pathchk.txt
whatis pathchk >>./HelpMan/pathchk.txt
pathchk --help >>./HelpMan/pathchk.txt
man pathchk >>./HelpMan/pathchk.txt
