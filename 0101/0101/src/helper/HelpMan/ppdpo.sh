#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ppdpo.txt
which ppdpo >>./HelpMan/ppdpo.txt
whatis ppdpo >>./HelpMan/ppdpo.txt
ppdpo --help >>./HelpMan/ppdpo.txt
man ppdpo >>./HelpMan/ppdpo.txt
