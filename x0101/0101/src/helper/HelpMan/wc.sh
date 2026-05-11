#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/wc.txt
which wc >>./HelpMan/wc.txt
whatis wc >>./HelpMan/wc.txt
wc --help >>./HelpMan/wc.txt
man wc >>./HelpMan/wc.txt
