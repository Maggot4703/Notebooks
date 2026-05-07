#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nmtui-connect.txt
which nmtui-connect >>./HelpMan/nmtui-connect.txt
whatis nmtui-connect >>./HelpMan/nmtui-connect.txt
nmtui-connect --help >>./HelpMan/nmtui-connect.txt
man nmtui-connect >>./HelpMan/nmtui-connect.txt
