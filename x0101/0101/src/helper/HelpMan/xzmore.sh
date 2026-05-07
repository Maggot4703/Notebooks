#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xzmore.txt
which xzmore >>./HelpMan/xzmore.txt
whatis xzmore >>./HelpMan/xzmore.txt
xzmore --help >>./HelpMan/xzmore.txt
man xzmore >>./HelpMan/xzmore.txt
