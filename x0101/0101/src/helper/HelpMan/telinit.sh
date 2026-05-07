#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/telinit.txt
which telinit >>./HelpMan/telinit.txt
whatis telinit >>./HelpMan/telinit.txt
telinit --help >>./HelpMan/telinit.txt
man telinit >>./HelpMan/telinit.txt
