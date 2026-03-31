#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ncal.txt
which ncal >>./HelpMan/ncal.txt
whatis ncal >>./HelpMan/ncal.txt
ncal --help >>./HelpMan/ncal.txt
man ncal >>./HelpMan/ncal.txt
