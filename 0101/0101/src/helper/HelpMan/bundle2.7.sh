#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bundle2.7.txt
which bundle2.7 >>./HelpMan/bundle2.7.txt
whatis bundle2.7 >>./HelpMan/bundle2.7.txt
bundle2.7 --help >>./HelpMan/bundle2.7.txt
man bundle2.7 >>./HelpMan/bundle2.7.txt
