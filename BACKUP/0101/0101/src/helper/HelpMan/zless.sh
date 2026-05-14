#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/zless.txt
which zless >>./HelpMan/zless.txt
whatis zless >>./HelpMan/zless.txt
zless --help >>./HelpMan/zless.txt
man zless >>./HelpMan/zless.txt
