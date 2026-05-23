#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aseqdump.txt
which aseqdump >>./HelpMan/aseqdump.txt
whatis aseqdump >>./HelpMan/aseqdump.txt
aseqdump --help >>./HelpMan/aseqdump.txt
man aseqdump >>./HelpMan/aseqdump.txt
