#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nsupdate.txt
which nsupdate >>./HelpMan/nsupdate.txt
whatis nsupdate >>./HelpMan/nsupdate.txt
nsupdate --help >>./HelpMan/nsupdate.txt
man nsupdate >>./HelpMan/nsupdate.txt
