#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkinitramfs.txt
which mkinitramfs >>./HelpMan/mkinitramfs.txt
whatis mkinitramfs >>./HelpMan/mkinitramfs.txt
mkinitramfs --help >>./HelpMan/mkinitramfs.txt
man mkinitramfs >>./HelpMan/mkinitramfs.txt
