#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nmcli.txt
which nmcli >>./HelpMan/nmcli.txt
whatis nmcli >>./HelpMan/nmcli.txt
nmcli --help >>./HelpMan/nmcli.txt
man nmcli >>./HelpMan/nmcli.txt
