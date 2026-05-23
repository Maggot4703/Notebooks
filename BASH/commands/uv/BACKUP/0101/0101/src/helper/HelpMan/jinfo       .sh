#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jinfo.txt
which jinfo >>./HelpMan/jinfo.txt
whatis jinfo >>./HelpMan/jinfo.txt
jinfo --help >>./HelpMan/jinfo.txt
man jinfo >>./HelpMan/jinfo.txt
