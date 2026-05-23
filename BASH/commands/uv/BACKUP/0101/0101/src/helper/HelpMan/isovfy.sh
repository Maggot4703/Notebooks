#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/isovfy.txt
which isovfy >>./HelpMan/isovfy.txt
whatis isovfy >>./HelpMan/isovfy.txt
isovfy --help >>./HelpMan/isovfy.txt
man isovfy >>./HelpMan/isovfy.txt
