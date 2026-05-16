#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bridge.txt
which bridge >>./HelpMan/bridge.txt
whatis bridge >>./HelpMan/bridge.txt
bridge --help >>./HelpMan/bridge.txt
man bridge >>./HelpMan/bridge.txt
