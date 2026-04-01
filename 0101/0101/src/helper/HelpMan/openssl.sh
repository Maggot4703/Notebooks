#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/openssl.txt
which openssl >>./HelpMan/openssl.txt
whatis openssl >>./HelpMan/openssl.txt
openssl --help >>./HelpMan/openssl.txt
man openssl >>./HelpMan/openssl.txt
