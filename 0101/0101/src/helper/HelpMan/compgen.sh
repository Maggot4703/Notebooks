#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/compgen.txt
which compgen >>./HelpMan/compgen.txt
whatis compgen >>./HelpMan/compgen.txt
compgen --help >>./HelpMan/compgen.txt
man compgen >>./HelpMan/compgen.txt
