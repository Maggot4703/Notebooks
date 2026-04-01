#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/udevadm.txt
which udevadm >>./HelpMan/udevadm.txt
whatis udevadm >>./HelpMan/udevadm.txt
udevadm --help >>./HelpMan/udevadm.txt
man udevadm >>./HelpMan/udevadm.txt
