#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lsinitramfs.txt
which lsinitramfs >>./HelpMan/lsinitramfs.txt
whatis lsinitramfs >>./HelpMan/lsinitramfs.txt
lsinitramfs --help >>./HelpMan/lsinitramfs.txt
man lsinitramfs >>./HelpMan/lsinitramfs.txt
