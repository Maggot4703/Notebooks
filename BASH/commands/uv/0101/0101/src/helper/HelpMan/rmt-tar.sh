#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rmt-tar.txt
which rmt-tar >>./HelpMan/rmt-tar.txt
whatis rmt-tar >>./HelpMan/rmt-tar.txt
rmt-tar --help >>./HelpMan/rmt-tar.txt
man rmt-tar >>./HelpMan/rmt-tar.txt
