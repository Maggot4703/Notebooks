#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nfnl_osf.txt
which nfnl_osf >>./HelpMan/nfnl_osf.txt
whatis nfnl_osf >>./HelpMan/nfnl_osf.txt
nfnl_osf --help >>./HelpMan/nfnl_osf.txt
man nfnl_osf >>./HelpMan/nfnl_osf.txt
