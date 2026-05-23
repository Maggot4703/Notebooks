#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/e4defrag.txt
which e4defrag >>./HelpMan/e4defrag.txt
whatis e4defrag >>./HelpMan/e4defrag.txt
e4defrag --help >>./HelpMan/e4defrag.txt
man e4defrag >>./HelpMan/e4defrag.txt
