#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/samba_kcc.txt
which samba_kcc >>./HelpMan/samba_kcc.txt
whatis samba_kcc >>./HelpMan/samba_kcc.txt
samba_kcc --help >>./HelpMan/samba_kcc.txt
man samba_kcc >>./HelpMan/samba_kcc.txt
