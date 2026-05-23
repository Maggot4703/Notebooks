#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-manager.txt
which update-manager >>./HelpMan/update-manager.txt
whatis update-manager >>./HelpMan/update-manager.txt
update-manager --help >>./HelpMan/update-manager.txt
man update-manager >>./HelpMan/update-manager.txt
