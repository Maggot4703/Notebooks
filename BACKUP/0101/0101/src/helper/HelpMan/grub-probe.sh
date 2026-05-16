#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grub-probe.txt
which grub-probe >>./HelpMan/grub-probe.txt
whatis grub-probe >>./HelpMan/grub-probe.txt
grub-probe --help >>./HelpMan/grub-probe.txt
man grub-probe >>./HelpMan/grub-probe.txt
