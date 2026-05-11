#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hexdump.txt
which hexdump >>./HelpMan/hexdump.txt
whatis hexdump >>./HelpMan/hexdump.txt
hexdump --help >>./HelpMan/hexdump.txt
man hexdump >>./HelpMan/hexdump.txt
