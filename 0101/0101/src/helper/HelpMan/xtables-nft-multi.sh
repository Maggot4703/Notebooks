#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xtables-nft-multi.txt
which xtables-nft-multi >>./HelpMan/xtables-nft-multi.txt
whatis xtables-nft-multi >>./HelpMan/xtables-nft-multi.txt
xtables-nft-multi --help >>./HelpMan/xtables-nft-multi.txt
man xtables-nft-multi >>./HelpMan/xtables-nft-multi.txt
