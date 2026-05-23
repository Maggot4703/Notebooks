#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nautilus-autorun-software.txt
which nautilus-autorun-software >>./HelpMan/nautilus-autorun-software.txt
whatis nautilus-autorun-software >>./HelpMan/nautilus-autorun-software.txt
nautilus-autorun-software --help >>./HelpMan/nautilus-autorun-software.txt
man nautilus-autorun-software >>./HelpMan/nautilus-autorun-software.txt
