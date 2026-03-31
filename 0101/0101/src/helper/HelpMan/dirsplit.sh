#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dirsplit.txt
which dirsplit >>./HelpMan/dirsplit.txt
whatis dirsplit >>./HelpMan/dirsplit.txt
dirsplit --help >>./HelpMan/dirsplit.txt
man dirsplit >>./HelpMan/dirsplit.txt
