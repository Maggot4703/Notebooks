#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ruby2.7.txt
which ruby2.7 >>./HelpMan/ruby2.7.txt
whatis ruby2.7 >>./HelpMan/ruby2.7.txt
ruby2.7 --help >>./HelpMan/ruby2.7.txt
man ruby2.7 >>./HelpMan/ruby2.7.txt
