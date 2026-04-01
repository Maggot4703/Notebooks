#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/keyring.txt
which keyring >>./HelpMan/keyring.txt
whatis keyring >>./HelpMan/keyring.txt
keyring --help >>./HelpMan/keyring.txt
man keyring >>./HelpMan/keyring.txt
