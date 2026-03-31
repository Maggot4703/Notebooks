#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/proxy.txt
which proxy >>./HelpMan/proxy.txt
whatis proxy >>./HelpMan/proxy.txt
proxy --help >>./HelpMan/proxy.txt
man proxy >>./HelpMan/proxy.txt
