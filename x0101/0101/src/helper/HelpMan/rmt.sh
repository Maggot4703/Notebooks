#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rmt.txt
which rmt >>./HelpMan/rmt.txt
whatis rmt >>./HelpMan/rmt.txt
rmt --help >>./HelpMan/rmt.txt
man rmt >>./HelpMan/rmt.txt
