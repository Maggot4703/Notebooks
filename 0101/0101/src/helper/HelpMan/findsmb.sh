#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/findsmb.txt
which findsmb >>./HelpMan/findsmb.txt
whatis findsmb >>./HelpMan/findsmb.txt
findsmb --help >>./HelpMan/findsmb.txt
man findsmb >>./HelpMan/findsmb.txt
