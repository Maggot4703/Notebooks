#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mclasserase.txt
which mclasserase >>./HelpMan/mclasserase.txt
whatis mclasserase >>./HelpMan/mclasserase.txt
mclasserase --help >>./HelpMan/mclasserase.txt
man mclasserase >>./HelpMan/mclasserase.txt
