#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/locale.txt
which locale >>./HelpMan/locale.txt
whatis locale >>./HelpMan/locale.txt
locale --help >>./HelpMan/locale.txt
man locale >>./HelpMan/locale.txt
