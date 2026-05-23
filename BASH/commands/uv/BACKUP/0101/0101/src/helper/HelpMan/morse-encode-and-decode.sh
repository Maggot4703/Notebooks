#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/morse-encode-and-decode.txt
which morse-encode-and-decode >>./HelpMan/morse-encode-and-decode.txt
whatis morse-encode-and-decode >>./HelpMan/morse-encode-and-decode.txt
morse-encode-and-decode --help >>./HelpMan/morse-encode-and-decode.txt
man morse-encode-and-decode >>./HelpMan/morse-encode-and-decode.txt
