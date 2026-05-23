#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/wpa_action.txt
which wpa_action >>./HelpMan/wpa_action.txt
whatis wpa_action >>./HelpMan/wpa_action.txt
wpa_action --help >>./HelpMan/wpa_action.txt
man wpa_action >>./HelpMan/wpa_action.txt
