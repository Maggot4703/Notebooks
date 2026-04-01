#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-grub-gfxpayload.txt
which update-grub-gfxpayload >>./HelpMan/update-grub-gfxpayload.txt
whatis update-grub-gfxpayload >>./HelpMan/update-grub-gfxpayload.txt
update-grub-gfxpayload --help >>./HelpMan/update-grub-gfxpayload.txt
man update-grub-gfxpayload >>./HelpMan/update-grub-gfxpayload.txt
