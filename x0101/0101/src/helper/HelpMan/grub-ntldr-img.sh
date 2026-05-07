#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-ntldr-img.txt
which grub-ntldr-img >>./HelpMan/grub-ntldr-img.txt
whatis grub-ntldr-img >>./HelpMan/grub-ntldr-img.txt
grub-ntldr-img --help >>./HelpMan/grub-ntldr-img.txt
man grub-ntldr-img >>./HelpMan/grub-ntldr-img.txt
