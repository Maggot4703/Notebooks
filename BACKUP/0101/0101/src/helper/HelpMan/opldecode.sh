#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/opldecode.txt
which opldecode >>./HelpMan/opldecode.txt
whatis opldecode >>./HelpMan/opldecode.txt
opldecode --help >>./HelpMan/opldecode.txt
man opldecode >>./HelpMan/opldecode.txt
