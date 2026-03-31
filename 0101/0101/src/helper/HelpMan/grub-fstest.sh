#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-fstest.txt
which grub-fstest >>./HelpMan/grub-fstest.txt
whatis grub-fstest >>./HelpMan/grub-fstest.txt
grub-fstest --help >>./HelpMan/grub-fstest.txt
man grub-fstest >>./HelpMan/grub-fstest.txt
