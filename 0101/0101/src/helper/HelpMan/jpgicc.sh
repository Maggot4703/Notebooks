#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jpgicc.txt
which jpgicc >>./HelpMan/jpgicc.txt
whatis jpgicc >>./HelpMan/jpgicc.txt
jpgicc --help >>./HelpMan/jpgicc.txt
man jpgicc >>./HelpMan/jpgicc.txt
