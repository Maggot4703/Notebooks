#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/brltty.txt
which brltty >>./HelpMan/brltty.txt
whatis brltty >>./HelpMan/brltty.txt
brltty --help >>./HelpMan/brltty.txt
man brltty >>./HelpMan/brltty.txt
