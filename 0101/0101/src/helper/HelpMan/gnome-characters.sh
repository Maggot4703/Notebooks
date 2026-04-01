#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-characters.txt
which gnome-characters >>./HelpMan/gnome-characters.txt
whatis gnome-characters >>./HelpMan/gnome-characters.txt
gnome-characters --help >>./HelpMan/gnome-characters.txt
man gnome-characters >>./HelpMan/gnome-characters.txt
