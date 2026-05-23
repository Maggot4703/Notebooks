#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-thumbnail-font.txt
which gnome-thumbnail-font >>./HelpMan/gnome-thumbnail-font.txt
whatis gnome-thumbnail-font >>./HelpMan/gnome-thumbnail-font.txt
gnome-thumbnail-font --help >>./HelpMan/gnome-thumbnail-font.txt
man gnome-thumbnail-font >>./HelpMan/gnome-thumbnail-font.txt
