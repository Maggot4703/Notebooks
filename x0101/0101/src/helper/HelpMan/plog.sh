#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/plog.txt
which plog >>./HelpMan/plog.txt
whatis plog >>./HelpMan/plog.txt
plog --help >>./HelpMan/plog.txt
man plog >>./HelpMan/plog.txt
