#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dnsmasq.txt
which dnsmasq >>./HelpMan/dnsmasq.txt
whatis dnsmasq >>./HelpMan/dnsmasq.txt
dnsmasq --help >>./HelpMan/dnsmasq.txt
man dnsmasq >>./HelpMan/dnsmasq.txt
