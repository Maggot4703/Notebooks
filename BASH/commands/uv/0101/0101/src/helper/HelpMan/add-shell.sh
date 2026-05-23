#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/add-shell.txt
which add-shell >>./HelpMan/add-shell.txt
whatis add-shell >>./HelpMan/add-shell.txt
add-shell --help >>./HelpMan/add-shell.txt
man add-shell >>./HelpMan/add-shell.txt
