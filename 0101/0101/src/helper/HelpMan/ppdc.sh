#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ppdc.txt
which ppdc >>./HelpMan/ppdc.txt
whatis ppdc >>./HelpMan/ppdc.txt
ppdc --help >>./HelpMan/ppdc.txt
man ppdc >>./HelpMan/ppdc.txt
