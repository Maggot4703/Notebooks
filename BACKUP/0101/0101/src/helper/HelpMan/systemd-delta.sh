#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-delta.txt
which systemd-delta >>./HelpMan/systemd-delta.txt
whatis systemd-delta >>./HelpMan/systemd-delta.txt
systemd-delta --help >>./HelpMan/systemd-delta.txt
man systemd-delta >>./HelpMan/systemd-delta.txt
