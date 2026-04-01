#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/transset.txt
which transset >>./HelpMan/transset.txt
whatis transset >>./HelpMan/transset.txt
transset --help >>./HelpMan/transset.txt
man transset >>./HelpMan/transset.txt
