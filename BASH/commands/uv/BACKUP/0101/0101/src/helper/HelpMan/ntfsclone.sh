#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ntfsclone.txt
which ntfsclone >>./HelpMan/ntfsclone.txt
whatis ntfsclone >>./HelpMan/ntfsclone.txt
ntfsclone --help >>./HelpMan/ntfsclone.txt
man ntfsclone >>./HelpMan/ntfsclone.txt
