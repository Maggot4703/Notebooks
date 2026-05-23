#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ebtables-save.txt
which ebtables-save >>./HelpMan/ebtables-save.txt
whatis ebtables-save >>./HelpMan/ebtables-save.txt
ebtables-save --help >>./HelpMan/ebtables-save.txt
man ebtables-save >>./HelpMan/ebtables-save.txt
