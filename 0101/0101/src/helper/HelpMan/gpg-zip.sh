#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gpg-zip.txt
which gpg-zip >>./HelpMan/gpg-zip.txt
whatis gpg-zip >>./HelpMan/gpg-zip.txt
gpg-zip --help >>./HelpMan/gpg-zip.txt
man gpg-zip >>./HelpMan/gpg-zip.txt
