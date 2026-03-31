#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xdg-icon-resource.txt
which xdg-icon-resource >>./HelpMan/xdg-icon-resource.txt
whatis xdg-icon-resource >>./HelpMan/xdg-icon-resource.txt
xdg-icon-resource --help >>./HelpMan/xdg-icon-resource.txt
man xdg-icon-resource >>./HelpMan/xdg-icon-resource.txt
