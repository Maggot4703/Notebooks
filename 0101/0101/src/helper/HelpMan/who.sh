#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/who.txt
which who >>./HelpMan/who.txt
whatis who >>./HelpMan/who.txt
who --help >>./HelpMan/who.txt
man who >>./HelpMan/who.txt
