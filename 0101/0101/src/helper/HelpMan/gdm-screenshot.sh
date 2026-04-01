#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gdm-screenshot.txt
which gdm-screenshot >>./HelpMan/gdm-screenshot.txt
whatis gdm-screenshot >>./HelpMan/gdm-screenshot.txt
gdm-screenshot --help >>./HelpMan/gdm-screenshot.txt
man gdm-screenshot >>./HelpMan/gdm-screenshot.txt
