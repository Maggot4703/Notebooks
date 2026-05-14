#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sshpk-verify.txt
which sshpk-verify >>./HelpMan/sshpk-verify.txt
whatis sshpk-verify >>./HelpMan/sshpk-verify.txt
sshpk-verify --help >>./HelpMan/sshpk-verify.txt
man sshpk-verify >>./HelpMan/sshpk-verify.txt
