#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/deja-dup.txt
which deja-dup >>./HelpMan/deja-dup.txt
whatis deja-dup >>./HelpMan/deja-dup.txt
deja-dup --help >>./HelpMan/deja-dup.txt
man deja-dup >>./HelpMan/deja-dup.txt
