#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-mount.txt
which grub-mount >>./HelpMan/grub-mount.txt
whatis grub-mount >>./HelpMan/grub-mount.txt
grub-mount --help >>./HelpMan/grub-mount.txt
man grub-mount >>./HelpMan/grub-mount.txt
