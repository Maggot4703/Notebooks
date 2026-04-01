#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/whoopsie.txt
which whoopsie >>./HelpMan/whoopsie.txt
whatis whoopsie >>./HelpMan/whoopsie.txt
whoopsie --help >>./HelpMan/whoopsie.txt
man whoopsie >>./HelpMan/whoopsie.txt
