#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pkcon.txt
which pkcon >>./HelpMan/pkcon.txt
whatis pkcon >>./HelpMan/pkcon.txt
pkcon --help >>./HelpMan/pkcon.txt
man pkcon >>./HelpMan/pkcon.txt
