#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/canberra-gtk-play.txt
which canberra-gtk-play >>./HelpMan/canberra-gtk-play.txt
whatis canberra-gtk-play >>./HelpMan/canberra-gtk-play.txt
canberra-gtk-play --help >>./HelpMan/canberra-gtk-play.txt
man canberra-gtk-play >>./HelpMan/canberra-gtk-play.txt
