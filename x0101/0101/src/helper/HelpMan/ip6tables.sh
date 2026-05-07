#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ip6tables.txt
which ip6tables >>./HelpMan/ip6tables.txt
whatis ip6tables >>./HelpMan/ip6tables.txt
ip6tables --help >>./HelpMan/ip6tables.txt
man ip6tables >>./HelpMan/ip6tables.txt
