#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sensible-editor.txt
which sensible-editor >>./HelpMan/sensible-editor.txt
whatis sensible-editor >>./HelpMan/sensible-editor.txt
sensible-editor --help >>./HelpMan/sensible-editor.txt
man sensible-editor >>./HelpMan/sensible-editor.txt
