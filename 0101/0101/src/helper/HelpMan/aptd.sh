#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aptd.txt
which aptd >>./HelpMan/aptd.txt
whatis aptd >>./HelpMan/aptd.txt
aptd --help >>./HelpMan/aptd.txt
man aptd >>./HelpMan/aptd.txt
