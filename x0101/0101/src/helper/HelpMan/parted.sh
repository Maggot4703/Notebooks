#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/parted.txt
which parted >>./HelpMan/parted.txt
whatis parted >>./HelpMan/parted.txt
parted --help >>./HelpMan/parted.txt
man parted >>./HelpMan/parted.txt
