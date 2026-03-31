#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/arpd.txt
which arpd >>./HelpMan/arpd.txt
whatis arpd >>./HelpMan/arpd.txt
arpd --help >>./HelpMan/arpd.txt
man arpd >>./HelpMan/arpd.txt
