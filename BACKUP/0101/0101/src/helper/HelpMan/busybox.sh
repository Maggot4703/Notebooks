#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/busybox.txt
which busybox >>./HelpMan/busybox.txt
whatis busybox >>./HelpMan/busybox.txt
busybox --help >>./HelpMan/busybox.txt
man busybox >>./HelpMan/busybox.txt
