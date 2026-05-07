#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/arptables-nft.txt
which arptables-nft >>./HelpMan/arptables-nft.txt
whatis arptables-nft >>./HelpMan/arptables-nft.txt
arptables-nft --help >>./HelpMan/arptables-nft.txt
man arptables-nft >>./HelpMan/arptables-nft.txt
