#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lsipc.txt
which lsipc >>./HelpMan/lsipc.txt
whatis lsipc >>./HelpMan/lsipc.txt
lsipc --help >>./HelpMan/lsipc.txt
man lsipc >>./HelpMan/lsipc.txt
