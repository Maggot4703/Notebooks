#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/syslinux-legacy.txt
which syslinux-legacy >>./HelpMan/syslinux-legacy.txt
whatis syslinux-legacy >>./HelpMan/syslinux-legacy.txt
syslinux-legacy --help >>./HelpMan/syslinux-legacy.txt
man syslinux-legacy >>./HelpMan/syslinux-legacy.txt
