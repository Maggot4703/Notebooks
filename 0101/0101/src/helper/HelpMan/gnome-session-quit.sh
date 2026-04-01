#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-session-quit.txt
which gnome-session-quit >>./HelpMan/gnome-session-quit.txt
whatis gnome-session-quit >>./HelpMan/gnome-session-quit.txt
gnome-session-quit --help >>./HelpMan/gnome-session-quit.txt
man gnome-session-quit >>./HelpMan/gnome-session-quit.txt
