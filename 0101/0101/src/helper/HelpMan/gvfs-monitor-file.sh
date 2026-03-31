#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gvfs-monitor-file.txt
which gvfs-monitor-file >>./HelpMan/gvfs-monitor-file.txt
whatis gvfs-monitor-file >>./HelpMan/gvfs-monitor-file.txt
gvfs-monitor-file --help >>./HelpMan/gvfs-monitor-file.txt
man gvfs-monitor-file >>./HelpMan/gvfs-monitor-file.txt
