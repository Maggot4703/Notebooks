#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-desktop-database.txt
which update-desktop-database >>./HelpMan/update-desktop-database.txt
whatis update-desktop-database >>./HelpMan/update-desktop-database.txt
update-desktop-database --help >>./HelpMan/update-desktop-database.txt
man update-desktop-database >>./HelpMan/update-desktop-database.txt
