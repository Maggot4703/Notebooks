#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-sysusers.txt
which systemd-sysusers >>./HelpMan/systemd-sysusers.txt
whatis systemd-sysusers >>./HelpMan/systemd-sysusers.txt
systemd-sysusers --help >>./HelpMan/systemd-sysusers.txt
man systemd-sysusers >>./HelpMan/systemd-sysusers.txt
