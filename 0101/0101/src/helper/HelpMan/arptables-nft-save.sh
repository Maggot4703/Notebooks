#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/arptables-nft-save.txt
which arptables-nft-save >>./HelpMan/arptables-nft-save.txt
whatis arptables-nft-save >>./HelpMan/arptables-nft-save.txt
arptables-nft-save --help >>./HelpMan/arptables-nft-save.txt
man arptables-nft-save >>./HelpMan/arptables-nft-save.txt
