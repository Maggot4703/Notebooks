#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bundler2.7.txt
which bundler2.7 >>./HelpMan/bundler2.7.txt
whatis bundler2.7 >>./HelpMan/bundler2.7.txt
bundler2.7 --help >>./HelpMan/bundler2.7.txt
man bundler2.7 >>./HelpMan/bundler2.7.txt
