#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ip6tables-legacy.txt
which ip6tables-legacy >>./HelpMan/ip6tables-legacy.txt
whatis ip6tables-legacy >>./HelpMan/ip6tables-legacy.txt
ip6tables-legacy --help >>./HelpMan/ip6tables-legacy.txt
man ip6tables-legacy >>./HelpMan/ip6tables-legacy.txt
