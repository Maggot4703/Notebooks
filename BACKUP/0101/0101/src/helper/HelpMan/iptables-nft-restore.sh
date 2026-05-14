#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iptables-nft-restore.txt
which iptables-nft-restore >>./HelpMan/iptables-nft-restore.txt
whatis iptables-nft-restore >>./HelpMan/iptables-nft-restore.txt
iptables-nft-restore --help >>./HelpMan/iptables-nft-restore.txt
man iptables-nft-restore >>./HelpMan/iptables-nft-restore.txt
