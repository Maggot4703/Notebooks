#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/scp.txt
which scp >>./HelpMan/scp.txt
whatis scp >>./HelpMan/scp.txt
scp --help >>./HelpMan/scp.txt
man scp >>./HelpMan/scp.txt
