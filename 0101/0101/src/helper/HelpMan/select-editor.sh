#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/select-editor.txt
which select-editor >>./HelpMan/select-editor.txt
whatis select-editor >>./HelpMan/select-editor.txt
select-editor --help >>./HelpMan/select-editor.txt
man select-editor >>./HelpMan/select-editor.txt
