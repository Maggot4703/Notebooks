#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/remove-default-wordlist.txt
which remove-default-wordlist >>./HelpMan/remove-default-wordlist.txt
whatis remove-default-wordlist >>./HelpMan/remove-default-wordlist.txt
remove-default-wordlist --help >>./HelpMan/remove-default-wordlist.txt
man remove-default-wordlist >>./HelpMan/remove-default-wordlist.txt
