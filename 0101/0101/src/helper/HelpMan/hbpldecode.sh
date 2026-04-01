#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hbpldecode.txt
which hbpldecode >>./HelpMan/hbpldecode.txt
whatis hbpldecode >>./HelpMan/hbpldecode.txt
hbpldecode --help >>./HelpMan/hbpldecode.txt
man hbpldecode >>./HelpMan/hbpldecode.txt
