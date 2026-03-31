#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mktemp.txt
which mktemp >>./HelpMan/mktemp.txt
whatis mktemp >>./HelpMan/mktemp.txt
mktemp --help >>./HelpMan/mktemp.txt
man mktemp >>./HelpMan/mktemp.txt
