#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-escape.txt
which systemd-escape >>./HelpMan/systemd-escape.txt
whatis systemd-escape >>./HelpMan/systemd-escape.txt
systemd-escape --help >>./HelpMan/systemd-escape.txt
man systemd-escape >>./HelpMan/systemd-escape.txt
