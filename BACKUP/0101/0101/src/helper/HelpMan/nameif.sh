#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nameif.txt
which nameif >>./HelpMan/nameif.txt
whatis nameif >>./HelpMan/nameif.txt
nameif --help >>./HelpMan/nameif.txt
man nameif >>./HelpMan/nameif.txt
