#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ibus-table-createdb.txt
which ibus-table-createdb >>./HelpMan/ibus-table-createdb.txt
whatis ibus-table-createdb >>./HelpMan/ibus-table-createdb.txt
ibus-table-createdb --help >>./HelpMan/ibus-table-createdb.txt
man ibus-table-createdb >>./HelpMan/ibus-table-createdb.txt
