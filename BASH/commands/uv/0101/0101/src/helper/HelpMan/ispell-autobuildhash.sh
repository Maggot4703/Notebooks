#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ispell-autobuildhash.txt
which ispell-autobuildhash >>./HelpMan/ispell-autobuildhash.txt
whatis ispell-autobuildhash >>./HelpMan/ispell-autobuildhash.txt
ispell-autobuildhash --help >>./HelpMan/ispell-autobuildhash.txt
man ispell-autobuildhash >>./HelpMan/ispell-autobuildhash.txt
