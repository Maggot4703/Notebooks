#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-file.txt
which grub-file >>./HelpMan/grub-file.txt
whatis grub-file >>./HelpMan/grub-file.txt
grub-file --help >>./HelpMan/grub-file.txt
man grub-file >>./HelpMan/grub-file.txt
