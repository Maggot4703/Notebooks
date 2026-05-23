#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ypdomainname.txt
which ypdomainname >>./HelpMan/ypdomainname.txt
whatis ypdomainname >>./HelpMan/ypdomainname.txt
ypdomainname --help >>./HelpMan/ypdomainname.txt
man ypdomainname >>./HelpMan/ypdomainname.txt
