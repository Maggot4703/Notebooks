#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dnsdomainname.txt
which dnsdomainname >>./HelpMan/dnsdomainname.txt
whatis dnsdomainname >>./HelpMan/dnsdomainname.txt
dnsdomainname --help >>./HelpMan/dnsdomainname.txt
man dnsdomainname >>./HelpMan/dnsdomainname.txt
