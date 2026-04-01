#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/zipsplit.txt
which zipsplit >>./HelpMan/zipsplit.txt
whatis zipsplit >>./HelpMan/zipsplit.txt
zipsplit --help >>./HelpMan/zipsplit.txt
man zipsplit >>./HelpMan/zipsplit.txt
