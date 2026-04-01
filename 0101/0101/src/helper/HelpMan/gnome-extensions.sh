#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-extensions.txt
which gnome-extensions >>./HelpMan/gnome-extensions.txt
whatis gnome-extensions >>./HelpMan/gnome-extensions.txt
gnome-extensions --help >>./HelpMan/gnome-extensions.txt
man gnome-extensions >>./HelpMan/gnome-extensions.txt
