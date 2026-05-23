#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ibus.txt
which ibus >>./HelpMan/ibus.txt
whatis ibus >>./HelpMan/ibus.txt
ibus --help >>./HelpMan/ibus.txt
man ibus >>./HelpMan/ibus.txt
