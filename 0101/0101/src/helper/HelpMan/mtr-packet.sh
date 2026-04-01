#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mtr-packet.txt
which mtr-packet >>./HelpMan/mtr-packet.txt
whatis mtr-packet >>./HelpMan/mtr-packet.txt
mtr-packet --help >>./HelpMan/mtr-packet.txt
man mtr-packet >>./HelpMan/mtr-packet.txt
