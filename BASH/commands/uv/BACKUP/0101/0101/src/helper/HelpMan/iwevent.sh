#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iwevent.txt
which iwevent >>./HelpMan/iwevent.txt
whatis iwevent >>./HelpMan/iwevent.txt
iwevent --help >>./HelpMan/iwevent.txt
man iwevent >>./HelpMan/iwevent.txt
