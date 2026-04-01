#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jdb.txt
which jdb >>./HelpMan/jdb.txt
whatis jdb >>./HelpMan/jdb.txt
jdb --help >>./HelpMan/jdb.txt
man jdb >>./HelpMan/jdb.txt
