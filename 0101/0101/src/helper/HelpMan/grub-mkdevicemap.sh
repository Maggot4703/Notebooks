#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-mkdevicemap.txt
which grub-mkdevicemap >>./HelpMan/grub-mkdevicemap.txt
whatis grub-mkdevicemap >>./HelpMan/grub-mkdevicemap.txt
grub-mkdevicemap --help >>./HelpMan/grub-mkdevicemap.txt
man grub-mkdevicemap >>./HelpMan/grub-mkdevicemap.txt
