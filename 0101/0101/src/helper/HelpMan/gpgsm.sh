#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gpgsm.txt
which gpgsm >>./HelpMan/gpgsm.txt
whatis gpgsm >>./HelpMan/gpgsm.txt
gpgsm --help >>./HelpMan/gpgsm.txt
man gpgsm >>./HelpMan/gpgsm.txt
