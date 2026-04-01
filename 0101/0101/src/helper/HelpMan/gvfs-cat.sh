#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gvfs-cat.txt
which gvfs-cat >>./HelpMan/gvfs-cat.txt
whatis gvfs-cat >>./HelpMan/gvfs-cat.txt
gvfs-cat --help >>./HelpMan/gvfs-cat.txt
man gvfs-cat >>./HelpMan/gvfs-cat.txt
