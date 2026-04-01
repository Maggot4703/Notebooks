#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/readonly.txt
which readonly >>./HelpMan/readonly.txt
whatis readonly >>./HelpMan/readonly.txt
readonly --help >>./HelpMan/readonly.txt
man readonly >>./HelpMan/readonly.txt
