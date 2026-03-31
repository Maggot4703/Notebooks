#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/oakdecode.txt
which oakdecode >>./HelpMan/oakdecode.txt
whatis oakdecode >>./HelpMan/oakdecode.txt
oakdecode --help >>./HelpMan/oakdecode.txt
man oakdecode >>./HelpMan/oakdecode.txt
