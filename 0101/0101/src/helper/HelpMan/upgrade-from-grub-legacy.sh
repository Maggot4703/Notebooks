#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/upgrade-from-grub-legacy.txt
which upgrade-from-grub-legacy >>./HelpMan/upgrade-from-grub-legacy.txt
whatis upgrade-from-grub-legacy >>./HelpMan/upgrade-from-grub-legacy.txt
upgrade-from-grub-legacy --help >>./HelpMan/upgrade-from-grub-legacy.txt
man upgrade-from-grub-legacy >>./HelpMan/upgrade-from-grub-legacy.txt
