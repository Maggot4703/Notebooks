#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gvfs-mount.txt
which gvfs-mount >>./HelpMan/gvfs-mount.txt
whatis gvfs-mount >>./HelpMan/gvfs-mount.txt
gvfs-mount --help >>./HelpMan/gvfs-mount.txt
man gvfs-mount >>./HelpMan/gvfs-mount.txt
