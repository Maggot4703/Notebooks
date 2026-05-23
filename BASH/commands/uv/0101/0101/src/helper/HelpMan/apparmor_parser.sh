#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apparmor_parser.txt
which apparmor_parser >>./HelpMan/apparmor_parser.txt
whatis apparmor_parser >>./HelpMan/apparmor_parser.txt
apparmor_parser --help >>./HelpMan/apparmor_parser.txt
man apparmor_parser >>./HelpMan/apparmor_parser.txt
