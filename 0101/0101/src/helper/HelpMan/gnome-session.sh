#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-session.txt
which gnome-session >>./HelpMan/gnome-session.txt
whatis gnome-session >>./HelpMan/gnome-session.txt
gnome-session --help >>./HelpMan/gnome-session.txt
man gnome-session >>./HelpMan/gnome-session.txt
