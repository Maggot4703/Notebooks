#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-reboot.txt
which grub-reboot >>./HelpMan/grub-reboot.txt
whatis grub-reboot >>./HelpMan/grub-reboot.txt
grub-reboot --help >>./HelpMan/grub-reboot.txt
man grub-reboot >>./HelpMan/grub-reboot.txt
