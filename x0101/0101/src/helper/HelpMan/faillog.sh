#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/faillog.txt
which faillog >>./HelpMan/faillog.txt
whatis faillog >>./HelpMan/faillog.txt
faillog --help >>./HelpMan/faillog.txt
man faillog >>./HelpMan/faillog.txt
