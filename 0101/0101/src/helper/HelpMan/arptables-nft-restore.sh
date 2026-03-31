#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/arptables-nft-restore.txt
which arptables-nft-restore >>./HelpMan/arptables-nft-restore.txt
whatis arptables-nft-restore >>./HelpMan/arptables-nft-restore.txt
arptables-nft-restore --help >>./HelpMan/arptables-nft-restore.txt
man arptables-nft-restore >>./HelpMan/arptables-nft-restore.txt
