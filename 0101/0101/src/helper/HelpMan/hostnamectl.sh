#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hostnamectl.txt
which hostnamectl >>./HelpMan/hostnamectl.txt
whatis hostnamectl >>./HelpMan/hostnamectl.txt
hostnamectl --help >>./HelpMan/hostnamectl.txt
man hostnamectl >>./HelpMan/hostnamectl.txt
