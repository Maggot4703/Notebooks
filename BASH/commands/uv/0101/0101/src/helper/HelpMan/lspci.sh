#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lspci.txt
which lspci >>./HelpMan/lspci.txt
whatis lspci >>./HelpMan/lspci.txt
lspci --help >>./HelpMan/lspci.txt
man lspci >>./HelpMan/lspci.txt
