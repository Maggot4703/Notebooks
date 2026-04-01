#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/resolvectl.txt
which resolvectl >>./HelpMan/resolvectl.txt
whatis resolvectl >>./HelpMan/resolvectl.txt
resolvectl --help >>./HelpMan/resolvectl.txt
man resolvectl >>./HelpMan/resolvectl.txt
