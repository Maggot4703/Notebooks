#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-mkconfig.txt
which grub-mkconfig >>./HelpMan/grub-mkconfig.txt
whatis grub-mkconfig >>./HelpMan/grub-mkconfig.txt
grub-mkconfig --help >>./HelpMan/grub-mkconfig.txt
man grub-mkconfig >>./HelpMan/grub-mkconfig.txt
