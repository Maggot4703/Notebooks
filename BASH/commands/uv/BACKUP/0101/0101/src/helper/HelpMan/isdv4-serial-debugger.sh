#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/isdv4-serial-debugger.txt
which isdv4-serial-debugger >>./HelpMan/isdv4-serial-debugger.txt
whatis isdv4-serial-debugger >>./HelpMan/isdv4-serial-debugger.txt
isdv4-serial-debugger --help >>./HelpMan/isdv4-serial-debugger.txt
man isdv4-serial-debugger >>./HelpMan/isdv4-serial-debugger.txt
