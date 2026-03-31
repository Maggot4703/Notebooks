#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pkg-config.txt
which pkg-config >>./HelpMan/pkg-config.txt
whatis pkg-config >>./HelpMan/pkg-config.txt
pkg-config --help >>./HelpMan/pkg-config.txt
man pkg-config >>./HelpMan/pkg-config.txt
