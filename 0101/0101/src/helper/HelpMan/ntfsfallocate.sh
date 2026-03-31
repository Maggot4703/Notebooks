#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ntfsfallocate.txt
which ntfsfallocate >>./HelpMan/ntfsfallocate.txt
whatis ntfsfallocate >>./HelpMan/ntfsfallocate.txt
ntfsfallocate --help >>./HelpMan/ntfsfallocate.txt
man ntfsfallocate >>./HelpMan/ntfsfallocate.txt
