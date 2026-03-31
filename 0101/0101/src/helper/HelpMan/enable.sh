#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/enable.txt
which enable >>./HelpMan/enable.txt
whatis enable >>./HelpMan/enable.txt
enable --help >>./HelpMan/enable.txt
man enable >>./HelpMan/enable.txt
