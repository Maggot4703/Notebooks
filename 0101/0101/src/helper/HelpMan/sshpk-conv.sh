#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sshpk-conv.txt
which sshpk-conv >>./HelpMan/sshpk-conv.txt
whatis sshpk-conv >>./HelpMan/sshpk-conv.txt
sshpk-conv --help >>./HelpMan/sshpk-conv.txt
man sshpk-conv >>./HelpMan/sshpk-conv.txt
