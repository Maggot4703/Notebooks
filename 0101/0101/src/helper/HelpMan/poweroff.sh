#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/poweroff.txt
which poweroff >>./HelpMan/poweroff.txt
whatis poweroff >>./HelpMan/poweroff.txt
poweroff --help >>./HelpMan/poweroff.txt
man poweroff >>./HelpMan/poweroff.txt
