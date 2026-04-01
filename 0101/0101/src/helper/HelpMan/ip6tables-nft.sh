#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ip6tables-nft.txt
which ip6tables-nft >>./HelpMan/ip6tables-nft.txt
whatis ip6tables-nft >>./HelpMan/ip6tables-nft.txt
ip6tables-nft --help >>./HelpMan/ip6tables-nft.txt
man ip6tables-nft >>./HelpMan/ip6tables-nft.txt
