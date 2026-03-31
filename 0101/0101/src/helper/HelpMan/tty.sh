#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tty.txt
which tty >>./HelpMan/tty.txt
whatis tty >>./HelpMan/tty.txt
tty --help >>./HelpMan/tty.txt
man tty >>./HelpMan/tty.txt
