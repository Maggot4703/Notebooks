#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mknod.txt
which mknod >>./HelpMan/mknod.txt
whatis mknod >>./HelpMan/mknod.txt
mknod --help >>./HelpMan/mknod.txt
man mknod >>./HelpMan/mknod.txt
