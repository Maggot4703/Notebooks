#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-syslinux2cfg.txt
which grub-syslinux2cfg >>./HelpMan/grub-syslinux2cfg.txt
whatis grub-syslinux2cfg >>./HelpMan/grub-syslinux2cfg.txt
grub-syslinux2cfg --help >>./HelpMan/grub-syslinux2cfg.txt
man grub-syslinux2cfg >>./HelpMan/grub-syslinux2cfg.txt
