#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/utmpdump.txt
which utmpdump >>./HelpMan/utmpdump.txt
whatis utmpdump >>./HelpMan/utmpdump.txt
utmpdump --help >>./HelpMan/utmpdump.txt
man utmpdump >>./HelpMan/utmpdump.txt
