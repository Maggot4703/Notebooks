#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-cracklib.txt
which update-cracklib >>./HelpMan/update-cracklib.txt
whatis update-cracklib >>./HelpMan/update-cracklib.txt
update-cracklib --help >>./HelpMan/update-cracklib.txt
man update-cracklib >>./HelpMan/update-cracklib.txt
