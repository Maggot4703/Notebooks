#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mount.fuse.txt
which mount.fuse >>./HelpMan/mount.fuse.txt
whatis mount.fuse >>./HelpMan/mount.fuse.txt
mount.fuse --help >>./HelpMan/mount.fuse.txt
man mount.fuse >>./HelpMan/mount.fuse.txt
