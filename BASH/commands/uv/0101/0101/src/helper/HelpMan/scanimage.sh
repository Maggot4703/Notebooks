#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/scanimage.txt
which scanimage >>./HelpMan/scanimage.txt
whatis scanimage >>./HelpMan/scanimage.txt
scanimage --help >>./HelpMan/scanimage.txt
man scanimage >>./HelpMan/scanimage.txt
