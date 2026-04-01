#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/kbxutil.txt
which kbxutil >>./HelpMan/kbxutil.txt
whatis kbxutil >>./HelpMan/kbxutil.txt
kbxutil --help >>./HelpMan/kbxutil.txt
man kbxutil >>./HelpMan/kbxutil.txt
