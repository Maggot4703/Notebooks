#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ip6tables-legacy-restore.txt
which ip6tables-legacy-restore >>./HelpMan/ip6tables-legacy-restore.txt
whatis ip6tables-legacy-restore >>./HelpMan/ip6tables-legacy-restore.txt
ip6tables-legacy-restore --help >>./HelpMan/ip6tables-legacy-restore.txt
man ip6tables-legacy-restore >>./HelpMan/ip6tables-legacy-restore.txt
