#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ntfscluster.txt
which ntfscluster >>./HelpMan/ntfscluster.txt
whatis ntfscluster >>./HelpMan/ntfscluster.txt
ntfscluster --help >>./HelpMan/ntfscluster.txt
man ntfscluster >>./HelpMan/ntfscluster.txt
