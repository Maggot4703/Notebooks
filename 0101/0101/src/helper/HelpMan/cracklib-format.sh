#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cracklib-format.txt
which cracklib-format >>./HelpMan/cracklib-format.txt
whatis cracklib-format >>./HelpMan/cracklib-format.txt
cracklib-format --help >>./HelpMan/cracklib-format.txt
man cracklib-format >>./HelpMan/cracklib-format.txt
