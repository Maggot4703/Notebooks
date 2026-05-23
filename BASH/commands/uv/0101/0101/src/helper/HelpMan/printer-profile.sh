#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/printer-profile.txt
which printer-profile >>./HelpMan/printer-profile.txt
whatis printer-profile >>./HelpMan/printer-profile.txt
printer-profile --help >>./HelpMan/printer-profile.txt
man printer-profile >>./HelpMan/printer-profile.txt
