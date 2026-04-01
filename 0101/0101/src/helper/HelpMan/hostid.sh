#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hostid.txt
which hostid >>./HelpMan/hostid.txt
whatis hostid >>./HelpMan/hostid.txt
hostid --help >>./HelpMan/hostid.txt
man hostid >>./HelpMan/hostid.txt
