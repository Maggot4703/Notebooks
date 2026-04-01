#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/locale-gen.txt
which locale-gen >>./HelpMan/locale-gen.txt
whatis locale-gen >>./HelpMan/locale-gen.txt
locale-gen --help >>./HelpMan/locale-gen.txt
man locale-gen >>./HelpMan/locale-gen.txt
