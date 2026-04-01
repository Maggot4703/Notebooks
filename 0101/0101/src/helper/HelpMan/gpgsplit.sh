#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gpgsplit.txt
which gpgsplit >>./HelpMan/gpgsplit.txt
whatis gpgsplit >>./HelpMan/gpgsplit.txt
gpgsplit --help >>./HelpMan/gpgsplit.txt
man gpgsplit >>./HelpMan/gpgsplit.txt
