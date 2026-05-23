#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/curl.txt
which curl >>./HelpMan/curl.txt
whatis curl >>./HelpMan/curl.txt
curl --help >>./HelpMan/curl.txt
man curl >>./HelpMan/curl.txt
