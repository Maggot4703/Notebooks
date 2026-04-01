#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/routel.txt
which routel >>./HelpMan/routel.txt
whatis routel >>./HelpMan/routel.txt
routel --help >>./HelpMan/routel.txt
man routel >>./HelpMan/routel.txt
