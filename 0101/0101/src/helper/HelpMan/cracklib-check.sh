#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cracklib-check.txt
which cracklib-check >>./HelpMan/cracklib-check.txt
whatis cracklib-check >>./HelpMan/cracklib-check.txt
cracklib-check --help >>./HelpMan/cracklib-check.txt
man cracklib-check >>./HelpMan/cracklib-check.txt
