#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cupsd.txt
which cupsd >>./HelpMan/cupsd.txt
whatis cupsd >>./HelpMan/cupsd.txt
cupsd --help >>./HelpMan/cupsd.txt
man cupsd >>./HelpMan/cupsd.txt
