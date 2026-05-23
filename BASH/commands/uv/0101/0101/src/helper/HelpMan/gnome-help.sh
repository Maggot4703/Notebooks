#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-help.txt
which gnome-help >>./HelpMan/gnome-help.txt
whatis gnome-help >>./HelpMan/gnome-help.txt
gnome-help --help >>./HelpMan/gnome-help.txt
man gnome-help >>./HelpMan/gnome-help.txt
