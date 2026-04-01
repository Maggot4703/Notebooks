#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ntfsdecrypt.txt
which ntfsdecrypt >>./HelpMan/ntfsdecrypt.txt
whatis ntfsdecrypt >>./HelpMan/ntfsdecrypt.txt
ntfsdecrypt --help >>./HelpMan/ntfsdecrypt.txt
man ntfsdecrypt >>./HelpMan/ntfsdecrypt.txt
