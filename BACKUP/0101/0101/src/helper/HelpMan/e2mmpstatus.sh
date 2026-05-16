#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/e2mmpstatus.txt
which e2mmpstatus >>./HelpMan/e2mmpstatus.txt
whatis e2mmpstatus >>./HelpMan/e2mmpstatus.txt
e2mmpstatus --help >>./HelpMan/e2mmpstatus.txt
man e2mmpstatus >>./HelpMan/e2mmpstatus.txt
