#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-set-default.txt
which grub-set-default >>./HelpMan/grub-set-default.txt
whatis grub-set-default >>./HelpMan/grub-set-default.txt
grub-set-default --help >>./HelpMan/grub-set-default.txt
man grub-set-default >>./HelpMan/grub-set-default.txt
