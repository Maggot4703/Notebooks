#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/getweb.txt
which getweb >>./HelpMan/getweb.txt
whatis getweb >>./HelpMan/getweb.txt
getweb --help >>./HelpMan/getweb.txt
man getweb >>./HelpMan/getweb.txt
