#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/padsp.txt
which padsp >>./HelpMan/padsp.txt
whatis padsp >>./HelpMan/padsp.txt
padsp --help >>./HelpMan/padsp.txt
man padsp >>./HelpMan/padsp.txt
