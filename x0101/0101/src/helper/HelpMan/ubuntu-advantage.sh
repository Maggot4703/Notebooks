#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ubuntu-advantage.txt
which ubuntu-advantage >>./HelpMan/ubuntu-advantage.txt
whatis ubuntu-advantage >>./HelpMan/ubuntu-advantage.txt
ubuntu-advantage --help >>./HelpMan/ubuntu-advantage.txt
man ubuntu-advantage >>./HelpMan/ubuntu-advantage.txt
