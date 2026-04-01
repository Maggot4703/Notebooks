#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/kquitapp5.txt
which kquitapp5 >>./HelpMan/kquitapp5.txt
whatis kquitapp5 >>./HelpMan/kquitapp5.txt
kquitapp5 --help >>./HelpMan/kquitapp5.txt
man kquitapp5 >>./HelpMan/kquitapp5.txt
