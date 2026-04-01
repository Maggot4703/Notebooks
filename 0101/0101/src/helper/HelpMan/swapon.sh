#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/swapon.txt
which swapon >>./HelpMan/swapon.txt
whatis swapon >>./HelpMan/swapon.txt
swapon --help >>./HelpMan/swapon.txt
man swapon >>./HelpMan/swapon.txt
