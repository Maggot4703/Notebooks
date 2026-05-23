#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rhythmbox.txt
which rhythmbox >>./HelpMan/rhythmbox.txt
whatis rhythmbox >>./HelpMan/rhythmbox.txt
rhythmbox --help >>./HelpMan/rhythmbox.txt
man rhythmbox >>./HelpMan/rhythmbox.txt
