#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-font-viewer.txt
which gnome-font-viewer >>./HelpMan/gnome-font-viewer.txt
whatis gnome-font-viewer >>./HelpMan/gnome-font-viewer.txt
gnome-font-viewer --help >>./HelpMan/gnome-font-viewer.txt
man gnome-font-viewer >>./HelpMan/gnome-font-viewer.txt
