#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/finger.txt
which finger >>./HelpMan/finger.txt
whatis finger >>./HelpMan/finger.txt
finger --help >>./HelpMan/finger.txt
man finger >>./HelpMan/finger.txt
