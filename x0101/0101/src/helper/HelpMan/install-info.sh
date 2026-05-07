#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/install-info.txt
which install-info >>./HelpMan/install-info.txt
whatis install-info >>./HelpMan/install-info.txt
install-info --help >>./HelpMan/install-info.txt
man install-info >>./HelpMan/install-info.txt
