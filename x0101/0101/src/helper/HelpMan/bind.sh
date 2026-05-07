#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bind.txt
which bind >>./HelpMan/bind.txt
whatis bind >>./HelpMan/bind.txt
bind --help >>./HelpMan/bind.txt
man bind >>./HelpMan/bind.txt
