#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-disk-image-mounter.txt
which gnome-disk-image-mounter >>./HelpMan/gnome-disk-image-mounter.txt
whatis gnome-disk-image-mounter >>./HelpMan/gnome-disk-image-mounter.txt
gnome-disk-image-mounter --help >>./HelpMan/gnome-disk-image-mounter.txt
man gnome-disk-image-mounter >>./HelpMan/gnome-disk-image-mounter.txt
