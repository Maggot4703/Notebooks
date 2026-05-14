#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gem2.7.txt
which gem2.7 >>./HelpMan/gem2.7.txt
whatis gem2.7 >>./HelpMan/gem2.7.txt
gem2.7 --help >>./HelpMan/gem2.7.txt
man gem2.7 >>./HelpMan/gem2.7.txt
