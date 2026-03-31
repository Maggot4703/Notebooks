#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/native2ascii.txt
which native2ascii >>./HelpMan/native2ascii.txt
whatis native2ascii >>./HelpMan/native2ascii.txt
native2ascii --help >>./HelpMan/native2ascii.txt
man native2ascii >>./HelpMan/native2ascii.txt
