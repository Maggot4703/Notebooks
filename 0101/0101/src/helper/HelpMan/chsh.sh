#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/chsh.txt
which chsh >>./HelpMan/chsh.txt
whatis chsh >>./HelpMan/chsh.txt
chsh --help >>./HelpMan/chsh.txt
man chsh >>./HelpMan/chsh.txt
