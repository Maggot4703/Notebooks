#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-glue-efi.txt
which grub-glue-efi >>./HelpMan/grub-glue-efi.txt
whatis grub-glue-efi >>./HelpMan/grub-glue-efi.txt
grub-glue-efi --help >>./HelpMan/grub-glue-efi.txt
man grub-glue-efi >>./HelpMan/grub-glue-efi.txt
