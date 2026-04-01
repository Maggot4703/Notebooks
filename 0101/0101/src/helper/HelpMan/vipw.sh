#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/vipw.txt
which vipw >>./HelpMan/vipw.txt
whatis vipw >>./HelpMan/vipw.txt
vipw --help >>./HelpMan/vipw.txt
man vipw >>./HelpMan/vipw.txt
