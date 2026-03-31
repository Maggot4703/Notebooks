#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/reboot.txt
which reboot >>./HelpMan/reboot.txt
whatis reboot >>./HelpMan/reboot.txt
reboot --help >>./HelpMan/reboot.txt
man reboot >>./HelpMan/reboot.txt
