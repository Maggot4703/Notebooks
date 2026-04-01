#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/addr2line.txt
which addr2line >>./HelpMan/addr2line.txt
whatis addr2line >>./HelpMan/addr2line.txt
addr2line --help >>./HelpMan/addr2line.txt
man addr2line >>./HelpMan/addr2line.txt
