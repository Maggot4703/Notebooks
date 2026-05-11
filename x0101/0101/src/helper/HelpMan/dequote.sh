#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dequote.txt
which dequote >>./HelpMan/dequote.txt
whatis dequote >>./HelpMan/dequote.txt
dequote --help >>./HelpMan/dequote.txt
man dequote >>./HelpMan/dequote.txt
