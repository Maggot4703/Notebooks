#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pppdump.txt
which pppdump >>./HelpMan/pppdump.txt
whatis pppdump >>./HelpMan/pppdump.txt
pppdump --help >>./HelpMan/pppdump.txt
man pppdump >>./HelpMan/pppdump.txt
