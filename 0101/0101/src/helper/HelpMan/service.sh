#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/service.txt
which service >>./HelpMan/service.txt
whatis service >>./HelpMan/service.txt
service --help >>./HelpMan/service.txt
man service >>./HelpMan/service.txt
