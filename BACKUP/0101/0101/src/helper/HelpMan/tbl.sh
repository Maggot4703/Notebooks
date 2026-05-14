#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tbl.txt
which tbl >>./HelpMan/tbl.txt
whatis tbl >>./HelpMan/tbl.txt
tbl --help >>./HelpMan/tbl.txt
man tbl >>./HelpMan/tbl.txt
