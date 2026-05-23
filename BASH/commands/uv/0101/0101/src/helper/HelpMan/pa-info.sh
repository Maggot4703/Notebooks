#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pa-info.txt
which pa-info >>./HelpMan/pa-info.txt
whatis pa-info >>./HelpMan/pa-info.txt
pa-info --help >>./HelpMan/pa-info.txt
man pa-info >>./HelpMan/pa-info.txt
