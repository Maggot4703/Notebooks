#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rvlc.txt
which rvlc >>./HelpMan/rvlc.txt
whatis rvlc >>./HelpMan/rvlc.txt
rvlc --help >>./HelpMan/rvlc.txt
man rvlc >>./HelpMan/rvlc.txt
