#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gjs-console.txt
which gjs-console >>./HelpMan/gjs-console.txt
whatis gjs-console >>./HelpMan/gjs-console.txt
gjs-console --help >>./HelpMan/gjs-console.txt
man gjs-console >>./HelpMan/gjs-console.txt
