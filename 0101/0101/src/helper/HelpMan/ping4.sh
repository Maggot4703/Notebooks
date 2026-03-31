#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ping4.txt
which ping4 >>./HelpMan/ping4.txt
whatis ping4 >>./HelpMan/ping4.txt
ping4 --help >>./HelpMan/ping4.txt
man ping4 >>./HelpMan/ping4.txt
