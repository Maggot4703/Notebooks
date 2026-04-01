#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/knavalbattle.txt
which knavalbattle >>./HelpMan/knavalbattle.txt
whatis knavalbattle >>./HelpMan/knavalbattle.txt
knavalbattle --help >>./HelpMan/knavalbattle.txt
man knavalbattle >>./HelpMan/knavalbattle.txt
