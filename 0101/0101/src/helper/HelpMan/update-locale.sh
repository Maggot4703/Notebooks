#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-locale.txt
which update-locale >>./HelpMan/update-locale.txt
whatis update-locale >>./HelpMan/update-locale.txt
update-locale --help >>./HelpMan/update-locale.txt
man update-locale >>./HelpMan/update-locale.txt
