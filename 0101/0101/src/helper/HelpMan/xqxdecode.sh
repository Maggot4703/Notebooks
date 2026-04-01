#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xqxdecode.txt
which xqxdecode >>./HelpMan/xqxdecode.txt
whatis xqxdecode >>./HelpMan/xqxdecode.txt
xqxdecode --help >>./HelpMan/xqxdecode.txt
man xqxdecode >>./HelpMan/xqxdecode.txt
