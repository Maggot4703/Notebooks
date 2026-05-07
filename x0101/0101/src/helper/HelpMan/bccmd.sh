#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bccmd.txt
which bccmd >>./HelpMan/bccmd.txt
whatis bccmd >>./HelpMan/bccmd.txt
bccmd --help >>./HelpMan/bccmd.txt
man bccmd >>./HelpMan/bccmd.txt
