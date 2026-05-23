#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gsettings.txt
which gsettings >>./HelpMan/gsettings.txt
whatis gsettings >>./HelpMan/gsettings.txt
gsettings --help >>./HelpMan/gsettings.txt
man gsettings >>./HelpMan/gsettings.txt
