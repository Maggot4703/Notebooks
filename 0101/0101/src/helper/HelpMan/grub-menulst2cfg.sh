#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-menulst2cfg.txt
which grub-menulst2cfg >>./HelpMan/grub-menulst2cfg.txt
whatis grub-menulst2cfg >>./HelpMan/grub-menulst2cfg.txt
grub-menulst2cfg --help >>./HelpMan/grub-menulst2cfg.txt
man grub-menulst2cfg >>./HelpMan/grub-menulst2cfg.txt
