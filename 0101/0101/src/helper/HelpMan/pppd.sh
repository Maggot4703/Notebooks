#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pppd.txt
which pppd >>./HelpMan/pppd.txt
whatis pppd >>./HelpMan/pppd.txt
pppd --help >>./HelpMan/pppd.txt
man pppd >>./HelpMan/pppd.txt
