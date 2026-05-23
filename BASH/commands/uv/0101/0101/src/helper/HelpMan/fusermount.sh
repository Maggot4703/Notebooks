#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fusermount.txt
which fusermount >>./HelpMan/fusermount.txt
whatis fusermount >>./HelpMan/fusermount.txt
fusermount --help >>./HelpMan/fusermount.txt
man fusermount >>./HelpMan/fusermount.txt
