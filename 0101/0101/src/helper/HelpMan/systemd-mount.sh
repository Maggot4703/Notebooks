#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-mount.txt
which systemd-mount >>./HelpMan/systemd-mount.txt
whatis systemd-mount >>./HelpMan/systemd-mount.txt
systemd-mount --help >>./HelpMan/systemd-mount.txt
man systemd-mount >>./HelpMan/systemd-mount.txt
