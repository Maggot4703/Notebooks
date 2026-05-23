#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-install.txt
which grub-install >>./HelpMan/grub-install.txt
whatis grub-install >>./HelpMan/grub-install.txt
grub-install --help >>./HelpMan/grub-install.txt
man grub-install >>./HelpMan/grub-install.txt
