#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nroff.txt
which nroff >>./HelpMan/nroff.txt
whatis nroff >>./HelpMan/nroff.txt
nroff --help >>./HelpMan/nroff.txt
man nroff >>./HelpMan/nroff.txt
