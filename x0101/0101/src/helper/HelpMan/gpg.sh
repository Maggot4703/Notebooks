#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gpg.txt
which gpg >>./HelpMan/gpg.txt
whatis gpg >>./HelpMan/gpg.txt
gpg --help >>./HelpMan/gpg.txt
man gpg >>./HelpMan/gpg.txt
