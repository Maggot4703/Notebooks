#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apport-cli.txt
which apport-cli >>./HelpMan/apport-cli.txt
whatis apport-cli >>./HelpMan/apport-cli.txt
apport-cli --help >>./HelpMan/apport-cli.txt
man apport-cli >>./HelpMan/apport-cli.txt
