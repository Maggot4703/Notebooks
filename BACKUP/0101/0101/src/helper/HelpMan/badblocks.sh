#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/badblocks.txt
which badblocks >>./HelpMan/badblocks.txt
whatis badblocks >>./HelpMan/badblocks.txt
badblocks --help >>./HelpMan/badblocks.txt
man badblocks >>./HelpMan/badblocks.txt
