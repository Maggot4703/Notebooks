#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/psfgettable.txt
which psfgettable >>./HelpMan/psfgettable.txt
whatis psfgettable >>./HelpMan/psfgettable.txt
psfgettable --help >>./HelpMan/psfgettable.txt
man psfgettable >>./HelpMan/psfgettable.txt
