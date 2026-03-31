#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/kernel-install.txt
which kernel-install >>./HelpMan/kernel-install.txt
whatis kernel-install >>./HelpMan/kernel-install.txt
kernel-install --help >>./HelpMan/kernel-install.txt
man kernel-install >>./HelpMan/kernel-install.txt
