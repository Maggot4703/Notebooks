#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-umount.txt
which systemd-umount >>./HelpMan/systemd-umount.txt
whatis systemd-umount >>./HelpMan/systemd-umount.txt
systemd-umount --help >>./HelpMan/systemd-umount.txt
man systemd-umount >>./HelpMan/systemd-umount.txt
