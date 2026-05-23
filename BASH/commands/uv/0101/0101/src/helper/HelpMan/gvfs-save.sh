#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gvfs-save.txt
which gvfs-save >>./HelpMan/gvfs-save.txt
whatis gvfs-save >>./HelpMan/gvfs-save.txt
gvfs-save --help >>./HelpMan/gvfs-save.txt
man gvfs-save >>./HelpMan/gvfs-save.txt
