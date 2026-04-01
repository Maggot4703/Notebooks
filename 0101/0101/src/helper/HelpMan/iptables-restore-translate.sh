#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iptables-restore-translate.txt
which iptables-restore-translate >>./HelpMan/iptables-restore-translate.txt
whatis iptables-restore-translate >>./HelpMan/iptables-restore-translate.txt
iptables-restore-translate --help >>./HelpMan/iptables-restore-translate.txt
man iptables-restore-translate >>./HelpMan/iptables-restore-translate.txt
