#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/slxdecode.txt
which slxdecode >>./HelpMan/slxdecode.txt
whatis slxdecode >>./HelpMan/slxdecode.txt
slxdecode --help >>./HelpMan/slxdecode.txt
man slxdecode >>./HelpMan/slxdecode.txt
