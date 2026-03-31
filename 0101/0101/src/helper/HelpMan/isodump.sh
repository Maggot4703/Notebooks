#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/isodump.txt
which isodump >>./HelpMan/isodump.txt
whatis isodump >>./HelpMan/isodump.txt
isodump --help >>./HelpMan/isodump.txt
man isodump >>./HelpMan/isodump.txt
