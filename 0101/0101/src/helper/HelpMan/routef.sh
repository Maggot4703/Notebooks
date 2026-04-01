#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/routef.txt
which routef >>./HelpMan/routef.txt
whatis routef >>./HelpMan/routef.txt
routef --help >>./HelpMan/routef.txt
man routef >>./HelpMan/routef.txt
