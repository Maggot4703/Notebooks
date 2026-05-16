#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cupstestppd.txt
which cupstestppd >>./HelpMan/cupstestppd.txt
whatis cupstestppd >>./HelpMan/cupstestppd.txt
cupstestppd --help >>./HelpMan/cupstestppd.txt
man cupstestppd >>./HelpMan/cupstestppd.txt
