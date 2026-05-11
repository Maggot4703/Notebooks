#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ps.txt
which ps >>./HelpMan/ps.txt
whatis ps >>./HelpMan/ps.txt
ps --help >>./HelpMan/ps.txt
man ps >>./HelpMan/ps.txt
