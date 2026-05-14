#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/chpasswd.txt
which chpasswd >>./HelpMan/chpasswd.txt
whatis chpasswd >>./HelpMan/chpasswd.txt
chpasswd --help >>./HelpMan/chpasswd.txt
man chpasswd >>./HelpMan/chpasswd.txt
