#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/whois.txt
which whois >>./HelpMan/whois.txt
whatis whois >>./HelpMan/whois.txt
whois --help >>./HelpMan/whois.txt
man whois >>./HelpMan/whois.txt
