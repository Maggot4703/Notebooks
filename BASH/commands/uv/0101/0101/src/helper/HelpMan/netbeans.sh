#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/netbeans.txt
which netbeans >>./HelpMan/netbeans.txt
whatis netbeans >>./HelpMan/netbeans.txt
netbeans --help >>./HelpMan/netbeans.txt
man netbeans >>./HelpMan/netbeans.txt
