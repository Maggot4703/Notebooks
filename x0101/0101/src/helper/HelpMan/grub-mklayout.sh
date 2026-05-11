#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-mklayout.txt
which grub-mklayout >>./HelpMan/grub-mklayout.txt
whatis grub-mklayout >>./HelpMan/grub-mklayout.txt
grub-mklayout --help >>./HelpMan/grub-mklayout.txt
man grub-mklayout >>./HelpMan/grub-mklayout.txt
