#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cups-browsed.txt
which cups-browsed >>./HelpMan/cups-browsed.txt
whatis cups-browsed >>./HelpMan/cups-browsed.txt
cups-browsed --help >>./HelpMan/cups-browsed.txt
man cups-browsed >>./HelpMan/cups-browsed.txt
