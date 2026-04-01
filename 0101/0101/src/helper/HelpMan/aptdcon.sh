#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aptdcon.txt
which aptdcon >>./HelpMan/aptdcon.txt
whatis aptdcon >>./HelpMan/aptdcon.txt
aptdcon --help >>./HelpMan/aptdcon.txt
man aptdcon >>./HelpMan/aptdcon.txt
