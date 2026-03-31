#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iptables.txt
which iptables >>./HelpMan/iptables.txt
whatis iptables >>./HelpMan/iptables.txt
iptables --help >>./HelpMan/iptables.txt
man iptables >>./HelpMan/iptables.txt
