#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/locale-check.txt
which locale-check >>./HelpMan/locale-check.txt
whatis locale-check >>./HelpMan/locale-check.txt
locale-check --help >>./HelpMan/locale-check.txt
man locale-check >>./HelpMan/locale-check.txt
