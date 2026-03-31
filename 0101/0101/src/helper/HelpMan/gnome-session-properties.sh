#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-session-properties.txt
which gnome-session-properties >>./HelpMan/gnome-session-properties.txt
whatis gnome-session-properties >>./HelpMan/gnome-session-properties.txt
gnome-session-properties --help >>./HelpMan/gnome-session-properties.txt
man gnome-session-properties >>./HelpMan/gnome-session-properties.txt
