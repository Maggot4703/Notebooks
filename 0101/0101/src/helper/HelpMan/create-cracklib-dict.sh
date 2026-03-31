#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/create-cracklib-dict.txt
which create-cracklib-dict >>./HelpMan/create-cracklib-dict.txt
whatis create-cracklib-dict >>./HelpMan/create-cracklib-dict.txt
create-cracklib-dict --help >>./HelpMan/create-cracklib-dict.txt
man create-cracklib-dict >>./HelpMan/create-cracklib-dict.txt
