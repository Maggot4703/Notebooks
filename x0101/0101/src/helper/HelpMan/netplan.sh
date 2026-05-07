#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/netplan.txt
which netplan >>./HelpMan/netplan.txt
whatis netplan >>./HelpMan/netplan.txt
netplan --help >>./HelpMan/netplan.txt
man netplan >>./HelpMan/netplan.txt
