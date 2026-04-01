#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apport-collect.txt
which apport-collect >>./HelpMan/apport-collect.txt
whatis apport-collect >>./HelpMan/apport-collect.txt
apport-collect --help >>./HelpMan/apport-collect.txt
man apport-collect >>./HelpMan/apport-collect.txt
