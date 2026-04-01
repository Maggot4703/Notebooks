#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lshw.txt
which lshw >>./HelpMan/lshw.txt
whatis lshw >>./HelpMan/lshw.txt
lshw --help >>./HelpMan/lshw.txt
man lshw >>./HelpMan/lshw.txt
