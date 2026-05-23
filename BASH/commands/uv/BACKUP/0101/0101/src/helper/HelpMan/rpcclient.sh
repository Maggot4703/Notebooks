#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rpcclient.txt
which rpcclient >>./HelpMan/rpcclient.txt
whatis rpcclient >>./HelpMan/rpcclient.txt
rpcclient --help >>./HelpMan/rpcclient.txt
man rpcclient >>./HelpMan/rpcclient.txt
