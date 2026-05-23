#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dh_dkms.txt
which dh_dkms >>./HelpMan/dh_dkms.txt
whatis dh_dkms >>./HelpMan/dh_dkms.txt
dh_dkms --help >>./HelpMan/dh_dkms.txt
man dh_dkms >>./HelpMan/dh_dkms.txt
