#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mcedit.txt
which mcedit >>./HelpMan/mcedit.txt
whatis mcedit >>./HelpMan/mcedit.txt
mcedit --help >>./HelpMan/mcedit.txt
man mcedit >>./HelpMan/mcedit.txt
