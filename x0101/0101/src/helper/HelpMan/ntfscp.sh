#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ntfscp.txt
which ntfscp >>./HelpMan/ntfscp.txt
whatis ntfscp >>./HelpMan/ntfscp.txt
ntfscp --help >>./HelpMan/ntfscp.txt
man ntfscp >>./HelpMan/ntfscp.txt
