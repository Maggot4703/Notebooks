#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sbkeysync.txt
which sbkeysync >>./HelpMan/sbkeysync.txt
whatis sbkeysync >>./HelpMan/sbkeysync.txt
sbkeysync --help >>./HelpMan/sbkeysync.txt
man sbkeysync >>./HelpMan/sbkeysync.txt
