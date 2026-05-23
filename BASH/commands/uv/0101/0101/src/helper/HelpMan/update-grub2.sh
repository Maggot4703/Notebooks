#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-grub2.txt
which update-grub2 >>./HelpMan/update-grub2.txt
whatis update-grub2 >>./HelpMan/update-grub2.txt
update-grub2 --help >>./HelpMan/update-grub2.txt
man update-grub2 >>./HelpMan/update-grub2.txt
