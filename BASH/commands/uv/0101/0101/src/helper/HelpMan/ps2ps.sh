#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ps2ps.txt
which ps2ps >>./HelpMan/ps2ps.txt
whatis ps2ps >>./HelpMan/ps2ps.txt
ps2ps --help >>./HelpMan/ps2ps.txt
man ps2ps >>./HelpMan/ps2ps.txt
