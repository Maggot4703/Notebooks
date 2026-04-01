#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gvfs-info.txt
which gvfs-info >>./HelpMan/gvfs-info.txt
whatis gvfs-info >>./HelpMan/gvfs-info.txt
gvfs-info --help >>./HelpMan/gvfs-info.txt
man gvfs-info >>./HelpMan/gvfs-info.txt
