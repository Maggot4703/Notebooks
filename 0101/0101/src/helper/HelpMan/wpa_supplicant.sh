#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/wpa_supplicant.txt
which wpa_supplicant >>./HelpMan/wpa_supplicant.txt
whatis wpa_supplicant >>./HelpMan/wpa_supplicant.txt
wpa_supplicant --help >>./HelpMan/wpa_supplicant.txt
man wpa_supplicant >>./HelpMan/wpa_supplicant.txt
