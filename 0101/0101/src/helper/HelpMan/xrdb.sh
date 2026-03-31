#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xrdb.txt
which xrdb >>./HelpMan/xrdb.txt
whatis xrdb >>./HelpMan/xrdb.txt
xrdb --help >>./HelpMan/xrdb.txt
man xrdb >>./HelpMan/xrdb.txt
