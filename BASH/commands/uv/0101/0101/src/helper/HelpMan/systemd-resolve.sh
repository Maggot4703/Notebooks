#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-resolve.txt
which systemd-resolve >>./HelpMan/systemd-resolve.txt
whatis systemd-resolve >>./HelpMan/systemd-resolve.txt
systemd-resolve --help >>./HelpMan/systemd-resolve.txt
man systemd-resolve >>./HelpMan/systemd-resolve.txt
