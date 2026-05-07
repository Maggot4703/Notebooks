#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-mkrescue.txt
which grub-mkrescue >>./HelpMan/grub-mkrescue.txt
whatis grub-mkrescue >>./HelpMan/grub-mkrescue.txt
grub-mkrescue --help >>./HelpMan/grub-mkrescue.txt
man grub-mkrescue >>./HelpMan/grub-mkrescue.txt
