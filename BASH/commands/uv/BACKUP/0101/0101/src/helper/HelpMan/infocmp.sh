#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/infocmp.txt
which infocmp >>./HelpMan/infocmp.txt
whatis infocmp >>./HelpMan/infocmp.txt
infocmp --help >>./HelpMan/infocmp.txt
man infocmp >>./HelpMan/infocmp.txt
