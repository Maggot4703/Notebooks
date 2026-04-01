#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/route.txt
which route >>./HelpMan/route.txt
whatis route >>./HelpMan/route.txt
route --help >>./HelpMan/route.txt
man route >>./HelpMan/route.txt
