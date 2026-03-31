#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nmtui-hostname.txt
which nmtui-hostname >>./HelpMan/nmtui-hostname.txt
whatis nmtui-hostname >>./HelpMan/nmtui-hostname.txt
nmtui-hostname --help >>./HelpMan/nmtui-hostname.txt
man nmtui-hostname >>./HelpMan/nmtui-hostname.txt
