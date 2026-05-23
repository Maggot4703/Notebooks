#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iptables-apply.txt
which iptables-apply >>./HelpMan/iptables-apply.txt
whatis iptables-apply >>./HelpMan/iptables-apply.txt
iptables-apply --help >>./HelpMan/iptables-apply.txt
man iptables-apply >>./HelpMan/iptables-apply.txt
