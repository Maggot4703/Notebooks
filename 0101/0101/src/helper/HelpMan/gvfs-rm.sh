#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gvfs-rm.txt
which gvfs-rm >>./HelpMan/gvfs-rm.txt
whatis gvfs-rm >>./HelpMan/gvfs-rm.txt
gvfs-rm --help >>./HelpMan/gvfs-rm.txt
man gvfs-rm >>./HelpMan/gvfs-rm.txt
