#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/wpa_cli.txt
which wpa_cli >>./HelpMan/wpa_cli.txt
whatis wpa_cli >>./HelpMan/wpa_cli.txt
wpa_cli --help >>./HelpMan/wpa_cli.txt
man wpa_cli >>./HelpMan/wpa_cli.txt
