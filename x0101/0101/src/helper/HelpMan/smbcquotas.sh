#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/smbcquotas.txt
which smbcquotas >>./HelpMan/smbcquotas.txt
whatis smbcquotas >>./HelpMan/smbcquotas.txt
smbcquotas --help >>./HelpMan/smbcquotas.txt
man smbcquotas >>./HelpMan/smbcquotas.txt
