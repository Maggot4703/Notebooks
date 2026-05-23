#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/file2brl.txt
which file2brl >>./HelpMan/file2brl.txt
whatis file2brl >>./HelpMan/file2brl.txt
file2brl --help >>./HelpMan/file2brl.txt
man file2brl >>./HelpMan/file2brl.txt
