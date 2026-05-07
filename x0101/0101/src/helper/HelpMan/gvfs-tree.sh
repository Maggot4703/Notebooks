#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gvfs-tree.txt
which gvfs-tree >>./HelpMan/gvfs-tree.txt
whatis gvfs-tree >>./HelpMan/gvfs-tree.txt
gvfs-tree --help >>./HelpMan/gvfs-tree.txt
man gvfs-tree >>./HelpMan/gvfs-tree.txt
