#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-cgtop.txt
which systemd-cgtop >>./HelpMan/systemd-cgtop.txt
whatis systemd-cgtop >>./HelpMan/systemd-cgtop.txt
systemd-cgtop --help >>./HelpMan/systemd-cgtop.txt
man systemd-cgtop >>./HelpMan/systemd-cgtop.txt
