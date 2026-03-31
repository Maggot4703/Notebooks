#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-cat.txt
which systemd-cat >>./HelpMan/systemd-cat.txt
whatis systemd-cat >>./HelpMan/systemd-cat.txt
systemd-cat --help >>./HelpMan/systemd-cat.txt
man systemd-cat >>./HelpMan/systemd-cat.txt
