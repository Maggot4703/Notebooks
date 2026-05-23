#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dirmngr.txt
which dirmngr >>./HelpMan/dirmngr.txt
whatis dirmngr >>./HelpMan/dirmngr.txt
dirmngr --help >>./HelpMan/dirmngr.txt
man dirmngr >>./HelpMan/dirmngr.txt
