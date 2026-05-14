#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/whoopsie-preferences.txt
which whoopsie-preferences >>./HelpMan/whoopsie-preferences.txt
whatis whoopsie-preferences >>./HelpMan/whoopsie-preferences.txt
whoopsie-preferences --help >>./HelpMan/whoopsie-preferences.txt
man whoopsie-preferences >>./HelpMan/whoopsie-preferences.txt
