#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dirmngr-client.txt
which dirmngr-client >>./HelpMan/dirmngr-client.txt
whatis dirmngr-client >>./HelpMan/dirmngr-client.txt
dirmngr-client --help >>./HelpMan/dirmngr-client.txt
man dirmngr-client >>./HelpMan/dirmngr-client.txt
