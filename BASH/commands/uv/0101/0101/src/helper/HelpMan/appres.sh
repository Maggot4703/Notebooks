#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/appres.txt
which appres >>./HelpMan/appres.txt
whatis appres >>./HelpMan/appres.txt
appres --help >>./HelpMan/appres.txt
man appres >>./HelpMan/appres.txt
