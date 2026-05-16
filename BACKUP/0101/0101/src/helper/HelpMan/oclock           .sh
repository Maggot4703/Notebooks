#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/oclock.txt
which oclock >>./HelpMan/oclock.txt
whatis oclock >>./HelpMan/oclock.txt
oclock --help >>./HelpMan/oclock.txt
man oclock >>./HelpMan/oclock.txt
