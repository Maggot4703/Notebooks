#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/uptime.txt
which uptime >>./HelpMan/uptime.txt
whatis uptime >>./HelpMan/uptime.txt
uptime --help >>./HelpMan/uptime.txt
man uptime >>./HelpMan/uptime.txt
