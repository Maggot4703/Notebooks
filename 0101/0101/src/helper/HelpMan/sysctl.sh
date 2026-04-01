#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sysctl.txt
which sysctl >>./HelpMan/sysctl.txt
whatis sysctl >>./HelpMan/sysctl.txt
sysctl --help >>./HelpMan/sysctl.txt
man sysctl >>./HelpMan/sysctl.txt
