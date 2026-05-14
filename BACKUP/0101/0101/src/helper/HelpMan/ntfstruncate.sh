#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ntfstruncate.txt
which ntfstruncate >>./HelpMan/ntfstruncate.txt
whatis ntfstruncate >>./HelpMan/ntfstruncate.txt
ntfstruncate --help >>./HelpMan/ntfstruncate.txt
man ntfstruncate >>./HelpMan/ntfstruncate.txt
