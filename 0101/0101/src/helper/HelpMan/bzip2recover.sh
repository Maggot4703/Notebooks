#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bzip2recover.txt
which bzip2recover >>./HelpMan/bzip2recover.txt
whatis bzip2recover >>./HelpMan/bzip2recover.txt
bzip2recover --help >>./HelpMan/bzip2recover.txt
man bzip2recover >>./HelpMan/bzip2recover.txt
