#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/syslinux.txt
which syslinux >>./HelpMan/syslinux.txt
whatis syslinux >>./HelpMan/syslinux.txt
syslinux --help >>./HelpMan/syslinux.txt
man syslinux >>./HelpMan/syslinux.txt
