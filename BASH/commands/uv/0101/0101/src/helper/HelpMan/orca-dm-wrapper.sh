#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/orca-dm-wrapper.txt
which orca-dm-wrapper >>./HelpMan/orca-dm-wrapper.txt
whatis orca-dm-wrapper >>./HelpMan/orca-dm-wrapper.txt
orca-dm-wrapper --help >>./HelpMan/orca-dm-wrapper.txt
man orca-dm-wrapper >>./HelpMan/orca-dm-wrapper.txt
