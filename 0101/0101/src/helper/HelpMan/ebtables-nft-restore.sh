#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ebtables-nft-restore.txt
which ebtables-nft-restore >>./HelpMan/ebtables-nft-restore.txt
whatis ebtables-nft-restore >>./HelpMan/ebtables-nft-restore.txt
ebtables-nft-restore --help >>./HelpMan/ebtables-nft-restore.txt
man ebtables-nft-restore >>./HelpMan/ebtables-nft-restore.txt
