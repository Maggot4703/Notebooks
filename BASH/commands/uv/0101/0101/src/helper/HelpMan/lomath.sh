#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lomath.txt
which lomath >>./HelpMan/lomath.txt
whatis lomath >>./HelpMan/lomath.txt
lomath --help >>./HelpMan/lomath.txt
man lomath >>./HelpMan/lomath.txt
