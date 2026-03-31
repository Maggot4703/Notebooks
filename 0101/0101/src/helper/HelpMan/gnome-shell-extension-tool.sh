#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-shell-extension-tool.txt
which gnome-shell-extension-tool >>./HelpMan/gnome-shell-extension-tool.txt
whatis gnome-shell-extension-tool >>./HelpMan/gnome-shell-extension-tool.txt
gnome-shell-extension-tool --help >>./HelpMan/gnome-shell-extension-tool.txt
man gnome-shell-extension-tool >>./HelpMan/gnome-shell-extension-tool.txt
