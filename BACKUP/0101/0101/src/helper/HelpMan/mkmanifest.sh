#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkmanifest.txt
which mkmanifest >>./HelpMan/mkmanifest.txt
whatis mkmanifest >>./HelpMan/mkmanifest.txt
mkmanifest --help >>./HelpMan/mkmanifest.txt
man mkmanifest >>./HelpMan/mkmanifest.txt
