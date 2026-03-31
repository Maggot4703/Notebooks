#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/editor.txt
which editor >>./HelpMan/editor.txt
whatis editor >>./HelpMan/editor.txt
editor --help >>./HelpMan/editor.txt
man editor >>./HelpMan/editor.txt
