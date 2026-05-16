#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ntfsusermap.txt
which ntfsusermap >>./HelpMan/ntfsusermap.txt
whatis ntfsusermap >>./HelpMan/ntfsusermap.txt
ntfsusermap --help >>./HelpMan/ntfsusermap.txt
man ntfsusermap >>./HelpMan/ntfsusermap.txt
