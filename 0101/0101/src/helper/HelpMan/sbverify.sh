#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sbverify.txt
which sbverify >>./HelpMan/sbverify.txt
whatis sbverify >>./HelpMan/sbverify.txt
sbverify --help >>./HelpMan/sbverify.txt
man sbverify >>./HelpMan/sbverify.txt
