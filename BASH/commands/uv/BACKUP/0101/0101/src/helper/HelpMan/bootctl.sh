#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bootctl.txt
which bootctl >>./HelpMan/bootctl.txt
whatis bootctl >>./HelpMan/bootctl.txt
bootctl --help >>./HelpMan/bootctl.txt
man bootctl >>./HelpMan/bootctl.txt
