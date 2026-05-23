#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ubuntu-drivers.txt
which ubuntu-drivers >>./HelpMan/ubuntu-drivers.txt
whatis ubuntu-drivers >>./HelpMan/ubuntu-drivers.txt
ubuntu-drivers --help >>./HelpMan/ubuntu-drivers.txt
man ubuntu-drivers >>./HelpMan/ubuntu-drivers.txt
