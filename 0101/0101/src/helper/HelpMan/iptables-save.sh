#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iptables-save.txt
which iptables-save >>./HelpMan/iptables-save.txt
whatis iptables-save >>./HelpMan/iptables-save.txt
iptables-save --help >>./HelpMan/iptables-save.txt
man iptables-save >>./HelpMan/iptables-save.txt
