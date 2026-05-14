#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/prezip-bin.txt
which prezip-bin >>./HelpMan/prezip-bin.txt
whatis prezip-bin >>./HelpMan/prezip-bin.txt
prezip-bin --help >>./HelpMan/prezip-bin.txt
man prezip-bin >>./HelpMan/prezip-bin.txt
