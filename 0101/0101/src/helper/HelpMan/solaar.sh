#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/solaar.txt
which solaar >>./HelpMan/solaar.txt
whatis solaar >>./HelpMan/solaar.txt
solaar --help >>./HelpMan/solaar.txt
man solaar >>./HelpMan/solaar.txt
