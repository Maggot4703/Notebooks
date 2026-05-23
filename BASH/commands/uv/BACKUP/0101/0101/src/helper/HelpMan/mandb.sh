#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mandb.txt
which mandb >>./HelpMan/mandb.txt
whatis mandb >>./HelpMan/mandb.txt
mandb --help >>./HelpMan/mandb.txt
man mandb >>./HelpMan/mandb.txt
