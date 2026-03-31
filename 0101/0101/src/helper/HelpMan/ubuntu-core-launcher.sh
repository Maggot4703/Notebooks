#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ubuntu-core-launcher.txt
which ubuntu-core-launcher >>./HelpMan/ubuntu-core-launcher.txt
whatis ubuntu-core-launcher >>./HelpMan/ubuntu-core-launcher.txt
ubuntu-core-launcher --help >>./HelpMan/ubuntu-core-launcher.txt
man ubuntu-core-launcher >>./HelpMan/ubuntu-core-launcher.txt
