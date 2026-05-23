#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/smproxy.txt
which smproxy >>./HelpMan/smproxy.txt
whatis smproxy >>./HelpMan/smproxy.txt
smproxy --help >>./HelpMan/smproxy.txt
man smproxy >>./HelpMan/smproxy.txt
