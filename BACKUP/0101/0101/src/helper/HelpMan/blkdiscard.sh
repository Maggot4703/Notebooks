#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/blkdiscard.txt
which blkdiscard >>./HelpMan/blkdiscard.txt
whatis blkdiscard >>./HelpMan/blkdiscard.txt
blkdiscard --help >>./HelpMan/blkdiscard.txt
man blkdiscard >>./HelpMan/blkdiscard.txt
