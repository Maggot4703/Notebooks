#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/prove.txt
which prove >>./HelpMan/prove.txt
whatis prove >>./HelpMan/prove.txt
prove --help >>./HelpMan/prove.txt
man prove >>./HelpMan/prove.txt
