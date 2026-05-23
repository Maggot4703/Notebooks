#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-initramfs.txt
which update-initramfs >>./HelpMan/update-initramfs.txt
whatis update-initramfs >>./HelpMan/update-initramfs.txt
update-initramfs --help >>./HelpMan/update-initramfs.txt
man update-initramfs >>./HelpMan/update-initramfs.txt
