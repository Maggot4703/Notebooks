#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-keyring-3.txt
which gnome-keyring-3 >>./HelpMan/gnome-keyring-3.txt
whatis gnome-keyring-3 >>./HelpMan/gnome-keyring-3.txt
gnome-keyring-3 --help >>./HelpMan/gnome-keyring-3.txt
man gnome-keyring-3 >>./HelpMan/gnome-keyring-3.txt
