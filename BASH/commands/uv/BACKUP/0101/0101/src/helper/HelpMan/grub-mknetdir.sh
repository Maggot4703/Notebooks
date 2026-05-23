#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-mknetdir.txt
which grub-mknetdir >>./HelpMan/grub-mknetdir.txt
whatis grub-mknetdir >>./HelpMan/grub-mknetdir.txt
grub-mknetdir --help >>./HelpMan/grub-mknetdir.txt
man grub-mknetdir >>./HelpMan/grub-mknetdir.txt
