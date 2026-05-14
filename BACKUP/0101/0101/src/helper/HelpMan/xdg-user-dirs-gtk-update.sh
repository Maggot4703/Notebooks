#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xdg-user-dirs-gtk-update.txt
which xdg-user-dirs-gtk-update >>./HelpMan/xdg-user-dirs-gtk-update.txt
whatis xdg-user-dirs-gtk-update >>./HelpMan/xdg-user-dirs-gtk-update.txt
xdg-user-dirs-gtk-update --help >>./HelpMan/xdg-user-dirs-gtk-update.txt
man xdg-user-dirs-gtk-update >>./HelpMan/xdg-user-dirs-gtk-update.txt
