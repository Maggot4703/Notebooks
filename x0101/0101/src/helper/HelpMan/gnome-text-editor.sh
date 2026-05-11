#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-text-editor.txt
which gnome-text-editor >>./HelpMan/gnome-text-editor.txt
whatis gnome-text-editor >>./HelpMan/gnome-text-editor.txt
gnome-text-editor --help >>./HelpMan/gnome-text-editor.txt
man gnome-text-editor >>./HelpMan/gnome-text-editor.txt
