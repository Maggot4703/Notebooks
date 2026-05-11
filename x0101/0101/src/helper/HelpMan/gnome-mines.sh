#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-mines.txt
which gnome-mines >>./HelpMan/gnome-mines.txt
whatis gnome-mines >>./HelpMan/gnome-mines.txt
gnome-mines --help >>./HelpMan/gnome-mines.txt
man gnome-mines >>./HelpMan/gnome-mines.txt
