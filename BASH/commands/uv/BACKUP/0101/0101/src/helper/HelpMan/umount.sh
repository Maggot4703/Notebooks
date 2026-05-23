#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/umount.txt
which umount >>./HelpMan/umount.txt
whatis umount >>./HelpMan/umount.txt
umount --help >>./HelpMan/umount.txt
man umount >>./HelpMan/umount.txt
