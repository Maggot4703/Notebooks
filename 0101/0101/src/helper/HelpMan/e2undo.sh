#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/e2undo.txt
which e2undo >>./HelpMan/e2undo.txt
whatis e2undo >>./HelpMan/e2undo.txt
e2undo --help >>./HelpMan/e2undo.txt
man e2undo >>./HelpMan/e2undo.txt
