#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/modinfo.txt
which modinfo >>./HelpMan/modinfo.txt
whatis modinfo >>./HelpMan/modinfo.txt
modinfo --help >>./HelpMan/modinfo.txt
man modinfo >>./HelpMan/modinfo.txt
