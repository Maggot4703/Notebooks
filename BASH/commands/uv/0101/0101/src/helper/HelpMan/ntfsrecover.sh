#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ntfsrecover.txt
which ntfsrecover >>./HelpMan/ntfsrecover.txt
whatis ntfsrecover >>./HelpMan/ntfsrecover.txt
ntfsrecover --help >>./HelpMan/ntfsrecover.txt
man ntfsrecover >>./HelpMan/ntfsrecover.txt
