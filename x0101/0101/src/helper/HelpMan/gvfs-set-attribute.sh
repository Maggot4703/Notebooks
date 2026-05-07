#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gvfs-set-attribute.txt
which gvfs-set-attribute >>./HelpMan/gvfs-set-attribute.txt
whatis gvfs-set-attribute >>./HelpMan/gvfs-set-attribute.txt
gvfs-set-attribute --help >>./HelpMan/gvfs-set-attribute.txt
man gvfs-set-attribute >>./HelpMan/gvfs-set-attribute.txt
