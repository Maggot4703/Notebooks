#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grog.txt
which grog >>./HelpMan/grog.txt
whatis grog >>./HelpMan/grog.txt
grog --help >>./HelpMan/grog.txt
man grog >>./HelpMan/grog.txt
