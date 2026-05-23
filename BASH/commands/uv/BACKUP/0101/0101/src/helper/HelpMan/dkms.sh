#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dkms.txt
which dkms >>./HelpMan/dkms.txt
whatis dkms >>./HelpMan/dkms.txt
dkms --help >>./HelpMan/dkms.txt
man dkms >>./HelpMan/dkms.txt
