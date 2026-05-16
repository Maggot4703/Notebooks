#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/unlz4.txt
which unlz4 >>./HelpMan/unlz4.txt
whatis unlz4 >>./HelpMan/unlz4.txt
unlz4 --help >>./HelpMan/unlz4.txt
man unlz4 >>./HelpMan/unlz4.txt
