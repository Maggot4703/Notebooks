#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dh_perl_openssl.txt
which dh_perl_openssl >>./HelpMan/dh_perl_openssl.txt
whatis dh_perl_openssl >>./HelpMan/dh_perl_openssl.txt
dh_perl_openssl --help >>./HelpMan/dh_perl_openssl.txt
man dh_perl_openssl >>./HelpMan/dh_perl_openssl.txt
