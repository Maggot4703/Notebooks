#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ischroot.txt
which ischroot >>./HelpMan/ischroot.txt
whatis ischroot >>./HelpMan/ischroot.txt
ischroot --help >>./HelpMan/ischroot.txt
man ischroot >>./HelpMan/ischroot.txt
