#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mke2fs.txt
which mke2fs >>./HelpMan/mke2fs.txt
whatis mke2fs >>./HelpMan/mke2fs.txt
mke2fs --help >>./HelpMan/mke2fs.txt
man mke2fs >>./HelpMan/mke2fs.txt
