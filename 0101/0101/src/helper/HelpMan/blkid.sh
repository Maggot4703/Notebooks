#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/blkid.txt
which blkid >>./HelpMan/blkid.txt
whatis blkid >>./HelpMan/blkid.txt
blkid --help >>./HelpMan/blkid.txt
man blkid >>./HelpMan/blkid.txt
