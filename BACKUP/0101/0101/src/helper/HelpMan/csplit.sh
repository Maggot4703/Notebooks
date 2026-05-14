#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/csplit.txt
which csplit >>./HelpMan/csplit.txt
whatis csplit >>./HelpMan/csplit.txt
csplit --help >>./HelpMan/csplit.txt
man csplit >>./HelpMan/csplit.txt
