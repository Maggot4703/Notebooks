#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nslookup.txt
which nslookup >>./HelpMan/nslookup.txt
whatis nslookup >>./HelpMan/nslookup.txt
nslookup --help >>./HelpMan/nslookup.txt
man nslookup >>./HelpMan/nslookup.txt
