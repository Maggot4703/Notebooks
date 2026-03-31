#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iptables-restore.txt
which iptables-restore >>./HelpMan/iptables-restore.txt
whatis iptables-restore >>./HelpMan/iptables-restore.txt
iptables-restore --help >>./HelpMan/iptables-restore.txt
man iptables-restore >>./HelpMan/iptables-restore.txt
