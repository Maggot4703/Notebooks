#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/oem-getlogs.txt
which oem-getlogs >>./HelpMan/oem-getlogs.txt
whatis oem-getlogs >>./HelpMan/oem-getlogs.txt
oem-getlogs --help >>./HelpMan/oem-getlogs.txt
man oem-getlogs >>./HelpMan/oem-getlogs.txt
