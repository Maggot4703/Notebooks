#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-bios-setup.txt
which grub-bios-setup >>./HelpMan/grub-bios-setup.txt
whatis grub-bios-setup >>./HelpMan/grub-bios-setup.txt
grub-bios-setup --help >>./HelpMan/grub-bios-setup.txt
man grub-bios-setup >>./HelpMan/grub-bios-setup.txt
