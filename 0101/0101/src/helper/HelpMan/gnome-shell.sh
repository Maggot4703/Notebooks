#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-shell.txt
which gnome-shell >>./HelpMan/gnome-shell.txt
whatis gnome-shell >>./HelpMan/gnome-shell.txt
gnome-shell --help >>./HelpMan/gnome-shell.txt
man gnome-shell >>./HelpMan/gnome-shell.txt
