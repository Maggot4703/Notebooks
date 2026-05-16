#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/setarch.txt
which setarch >>./HelpMan/setarch.txt
whatis setarch >>./HelpMan/setarch.txt
setarch --help >>./HelpMan/setarch.txt
man setarch >>./HelpMan/setarch.txt
