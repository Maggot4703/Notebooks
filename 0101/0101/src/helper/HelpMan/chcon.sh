#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/chcon.txt
which chcon >>./HelpMan/chcon.txt
whatis chcon >>./HelpMan/chcon.txt
chcon --help >>./HelpMan/chcon.txt
man chcon >>./HelpMan/chcon.txt
