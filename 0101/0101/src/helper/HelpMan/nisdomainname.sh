#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nisdomainname.txt
which nisdomainname >>./HelpMan/nisdomainname.txt
whatis nisdomainname >>./HelpMan/nisdomainname.txt
nisdomainname --help >>./HelpMan/nisdomainname.txt
man nisdomainname >>./HelpMan/nisdomainname.txt
