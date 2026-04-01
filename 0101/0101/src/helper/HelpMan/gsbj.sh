#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gsbj.txt
which gsbj >>./HelpMan/gsbj.txt
whatis gsbj >>./HelpMan/gsbj.txt
gsbj --help >>./HelpMan/gsbj.txt
man gsbj >>./HelpMan/gsbj.txt
