#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-mime-database.txt
which update-mime-database >>./HelpMan/update-mime-database.txt
whatis update-mime-database >>./HelpMan/update-mime-database.txt
update-mime-database --help >>./HelpMan/update-mime-database.txt
man update-mime-database >>./HelpMan/update-mime-database.txt
