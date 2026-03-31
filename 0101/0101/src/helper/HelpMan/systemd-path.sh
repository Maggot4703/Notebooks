#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-path.txt
which systemd-path >>./HelpMan/systemd-path.txt
whatis systemd-path >>./HelpMan/systemd-path.txt
systemd-path --help >>./HelpMan/systemd-path.txt
man systemd-path >>./HelpMan/systemd-path.txt
