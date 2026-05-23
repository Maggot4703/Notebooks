#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-detect-virt.txt
which systemd-detect-virt >>./HelpMan/systemd-detect-virt.txt
whatis systemd-detect-virt >>./HelpMan/systemd-detect-virt.txt
systemd-detect-virt --help >>./HelpMan/systemd-detect-virt.txt
man systemd-detect-virt >>./HelpMan/systemd-detect-virt.txt
