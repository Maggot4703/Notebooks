#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mksquashfs.txt
which mksquashfs >>./HelpMan/mksquashfs.txt
whatis mksquashfs >>./HelpMan/mksquashfs.txt
mksquashfs --help >>./HelpMan/mksquashfs.txt
man mksquashfs >>./HelpMan/mksquashfs.txt
