#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/vboxballoonctrl.txt
which vboxballoonctrl >>./HelpMan/vboxballoonctrl.txt
whatis vboxballoonctrl >>./HelpMan/vboxballoonctrl.txt
vboxballoonctrl --help >>./HelpMan/vboxballoonctrl.txt
man vboxballoonctrl >>./HelpMan/vboxballoonctrl.txt
