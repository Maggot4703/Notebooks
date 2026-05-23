#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/deb-systemd-helper.txt
which deb-systemd-helper >>./HelpMan/deb-systemd-helper.txt
whatis deb-systemd-helper >>./HelpMan/deb-systemd-helper.txt
deb-systemd-helper --help >>./HelpMan/deb-systemd-helper.txt
man deb-systemd-helper >>./HelpMan/deb-systemd-helper.txt
