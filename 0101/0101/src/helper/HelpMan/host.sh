#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/host.txt
which host >>./HelpMan/host.txt
whatis host >>./HelpMan/host.txt
host --help >>./HelpMan/host.txt
man host >>./HelpMan/host.txt
