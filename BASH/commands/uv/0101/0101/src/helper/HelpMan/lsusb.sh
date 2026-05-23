#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lsusb.txt
which lsusb >>./HelpMan/lsusb.txt
whatis lsusb >>./HelpMan/lsusb.txt
lsusb --help >>./HelpMan/lsusb.txt
man lsusb >>./HelpMan/lsusb.txt
