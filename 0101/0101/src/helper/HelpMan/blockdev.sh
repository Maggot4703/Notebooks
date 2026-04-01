#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/blockdev.txt
which blockdev >>./HelpMan/blockdev.txt
whatis blockdev >>./HelpMan/blockdev.txt
blockdev --help >>./HelpMan/blockdev.txt
man blockdev >>./HelpMan/blockdev.txt
