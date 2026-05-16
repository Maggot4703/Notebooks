#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/expiry.txt
which expiry >>./HelpMan/expiry.txt
whatis expiry >>./HelpMan/expiry.txt
expiry --help >>./HelpMan/expiry.txt
man expiry >>./HelpMan/expiry.txt
