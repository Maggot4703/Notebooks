#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ldd.txt
which ldd >>./HelpMan/ldd.txt
whatis ldd >>./HelpMan/ldd.txt
ldd --help >>./HelpMan/ldd.txt
man ldd >>./HelpMan/ldd.txt
