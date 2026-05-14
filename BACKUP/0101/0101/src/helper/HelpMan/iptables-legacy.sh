#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iptables-legacy.txt
which iptables-legacy >>./HelpMan/iptables-legacy.txt
whatis iptables-legacy >>./HelpMan/iptables-legacy.txt
iptables-legacy --help >>./HelpMan/iptables-legacy.txt
man iptables-legacy >>./HelpMan/iptables-legacy.txt
