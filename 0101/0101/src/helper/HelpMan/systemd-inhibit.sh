#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-inhibit.txt
which systemd-inhibit >>./HelpMan/systemd-inhibit.txt
whatis systemd-inhibit >>./HelpMan/systemd-inhibit.txt
systemd-inhibit --help >>./HelpMan/systemd-inhibit.txt
man systemd-inhibit >>./HelpMan/systemd-inhibit.txt
