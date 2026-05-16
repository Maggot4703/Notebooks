#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-firmware.txt
which hp-firmware >>./HelpMan/hp-firmware.txt
whatis hp-firmware >>./HelpMan/hp-firmware.txt
hp-firmware --help >>./HelpMan/hp-firmware.txt
man hp-firmware >>./HelpMan/hp-firmware.txt
