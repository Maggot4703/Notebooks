#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-calendar.txt
which gnome-calendar >>./HelpMan/gnome-calendar.txt
whatis gnome-calendar >>./HelpMan/gnome-calendar.txt
gnome-calendar --help >>./HelpMan/gnome-calendar.txt
man gnome-calendar >>./HelpMan/gnome-calendar.txt
