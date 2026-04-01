#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkpasswd.txt
which mkpasswd >>./HelpMan/mkpasswd.txt
whatis mkpasswd >>./HelpMan/mkpasswd.txt
mkpasswd --help >>./HelpMan/mkpasswd.txt
man mkpasswd >>./HelpMan/mkpasswd.txt
