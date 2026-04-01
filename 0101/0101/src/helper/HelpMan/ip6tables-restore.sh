#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ip6tables-restore.txt
which ip6tables-restore >>./HelpMan/ip6tables-restore.txt
whatis ip6tables-restore >>./HelpMan/ip6tables-restore.txt
ip6tables-restore --help >>./HelpMan/ip6tables-restore.txt
man ip6tables-restore >>./HelpMan/ip6tables-restore.txt
