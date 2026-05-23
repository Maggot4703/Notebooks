#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/smbcacls.txt
which smbcacls >>./HelpMan/smbcacls.txt
whatis smbcacls >>./HelpMan/smbcacls.txt
smbcacls --help >>./HelpMan/smbcacls.txt
man smbcacls >>./HelpMan/smbcacls.txt
