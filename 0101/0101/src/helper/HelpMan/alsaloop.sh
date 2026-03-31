#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/alsaloop.txt
which alsaloop >>./HelpMan/alsaloop.txt
whatis alsaloop >>./HelpMan/alsaloop.txt
alsaloop --help >>./HelpMan/alsaloop.txt
man alsaloop >>./HelpMan/alsaloop.txt
