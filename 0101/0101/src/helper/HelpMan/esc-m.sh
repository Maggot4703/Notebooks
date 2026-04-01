#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/esc-m.txt
which esc-m >>./HelpMan/esc-m.txt
whatis esc-m >>./HelpMan/esc-m.txt
esc-m --help >>./HelpMan/esc-m.txt
man esc-m >>./HelpMan/esc-m.txt
