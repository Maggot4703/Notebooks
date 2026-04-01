#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lzcmp.txt
which lzcmp >>./HelpMan/lzcmp.txt
whatis lzcmp >>./HelpMan/lzcmp.txt
lzcmp --help >>./HelpMan/lzcmp.txt
man lzcmp >>./HelpMan/lzcmp.txt
