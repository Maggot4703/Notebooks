#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-macbless.txt
which grub-macbless >>./HelpMan/grub-macbless.txt
whatis grub-macbless >>./HelpMan/grub-macbless.txt
grub-macbless --help >>./HelpMan/grub-macbless.txt
man grub-macbless >>./HelpMan/grub-macbless.txt
