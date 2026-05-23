#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ntfsfix.txt
which ntfsfix >>./HelpMan/ntfsfix.txt
whatis ntfsfix >>./HelpMan/ntfsfix.txt
ntfsfix --help >>./HelpMan/ntfsfix.txt
man ntfsfix >>./HelpMan/ntfsfix.txt
