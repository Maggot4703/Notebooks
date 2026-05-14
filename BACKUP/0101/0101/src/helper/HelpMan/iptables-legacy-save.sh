#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iptables-legacy-save.txt
which iptables-legacy-save >>./HelpMan/iptables-legacy-save.txt
whatis iptables-legacy-save >>./HelpMan/iptables-legacy-save.txt
iptables-legacy-save --help >>./HelpMan/iptables-legacy-save.txt
man iptables-legacy-save >>./HelpMan/iptables-legacy-save.txt
