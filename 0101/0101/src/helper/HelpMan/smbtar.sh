#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/smbtar.txt
which smbtar >>./HelpMan/smbtar.txt
whatis smbtar >>./HelpMan/smbtar.txt
smbtar --help >>./HelpMan/smbtar.txt
man smbtar >>./HelpMan/smbtar.txt
