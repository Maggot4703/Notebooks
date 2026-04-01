#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gvfs-copy.txt
which gvfs-copy >>./HelpMan/gvfs-copy.txt
whatis gvfs-copy >>./HelpMan/gvfs-copy.txt
gvfs-copy --help >>./HelpMan/gvfs-copy.txt
man gvfs-copy >>./HelpMan/gvfs-copy.txt
