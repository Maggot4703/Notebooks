#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ebtables-restore.txt
which ebtables-restore >>./HelpMan/ebtables-restore.txt
whatis ebtables-restore >>./HelpMan/ebtables-restore.txt
ebtables-restore --help >>./HelpMan/ebtables-restore.txt
man ebtables-restore >>./HelpMan/ebtables-restore.txt
