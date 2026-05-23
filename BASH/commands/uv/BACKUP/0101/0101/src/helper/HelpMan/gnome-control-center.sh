#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-control-center.txt
which gnome-control-center >>./HelpMan/gnome-control-center.txt
whatis gnome-control-center >>./HelpMan/gnome-control-center.txt
gnome-control-center --help >>./HelpMan/gnome-control-center.txt
man gnome-control-center >>./HelpMan/gnome-control-center.txt
