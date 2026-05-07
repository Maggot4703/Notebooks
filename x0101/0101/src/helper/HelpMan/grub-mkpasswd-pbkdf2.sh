#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-mkpasswd-pbkdf2.txt
which grub-mkpasswd-pbkdf2 >>./HelpMan/grub-mkpasswd-pbkdf2.txt
whatis grub-mkpasswd-pbkdf2 >>./HelpMan/grub-mkpasswd-pbkdf2.txt
grub-mkpasswd-pbkdf2 --help >>./HelpMan/grub-mkpasswd-pbkdf2.txt
man grub-mkpasswd-pbkdf2 >>./HelpMan/grub-mkpasswd-pbkdf2.txt
