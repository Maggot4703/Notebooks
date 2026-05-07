#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/halt.txt
which halt >>./HelpMan/halt.txt
whatis halt >>./HelpMan/halt.txt
halt --help >>./HelpMan/halt.txt
man halt >>./HelpMan/halt.txt
