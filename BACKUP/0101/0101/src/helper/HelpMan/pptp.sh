#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pptp.txt
which pptp >>./HelpMan/pptp.txt
whatis pptp >>./HelpMan/pptp.txt
pptp --help >>./HelpMan/pptp.txt
man pptp >>./HelpMan/pptp.txt
