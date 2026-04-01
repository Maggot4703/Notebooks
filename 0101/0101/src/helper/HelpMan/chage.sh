#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/chage.txt
which chage >>./HelpMan/chage.txt
whatis chage >>./HelpMan/chage.txt
chage --help >>./HelpMan/chage.txt
man chage >>./HelpMan/chage.txt
