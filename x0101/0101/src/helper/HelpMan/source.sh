#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/source.txt
which source >>./HelpMan/source.txt
whatis source >>./HelpMan/source.txt
source --help >>./HelpMan/source.txt
man source >>./HelpMan/source.txt
