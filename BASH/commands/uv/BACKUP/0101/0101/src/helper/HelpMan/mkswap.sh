#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkswap.txt
which mkswap >>./HelpMan/mkswap.txt
whatis mkswap >>./HelpMan/mkswap.txt
mkswap --help >>./HelpMan/mkswap.txt
man mkswap >>./HelpMan/mkswap.txt
