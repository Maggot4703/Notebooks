#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lpmove.txt
which lpmove >>./HelpMan/lpmove.txt
whatis lpmove >>./HelpMan/lpmove.txt
lpmove --help >>./HelpMan/lpmove.txt
man lpmove >>./HelpMan/lpmove.txt
