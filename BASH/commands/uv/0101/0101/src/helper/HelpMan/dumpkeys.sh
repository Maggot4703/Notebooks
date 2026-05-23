#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dumpkeys.txt
which dumpkeys >>./HelpMan/dumpkeys.txt
whatis dumpkeys >>./HelpMan/dumpkeys.txt
dumpkeys --help >>./HelpMan/dumpkeys.txt
man dumpkeys >>./HelpMan/dumpkeys.txt
