#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ip6tables-restore-translate.txt
which ip6tables-restore-translate >>./HelpMan/ip6tables-restore-translate.txt
whatis ip6tables-restore-translate >>./HelpMan/ip6tables-restore-translate.txt
ip6tables-restore-translate --help >>./HelpMan/ip6tables-restore-translate.txt
man ip6tables-restore-translate >>./HelpMan/ip6tables-restore-translate.txt
