#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg.txt
which dpkg >>./HelpMan/dpkg.txt
whatis dpkg >>./HelpMan/dpkg.txt
dpkg --help >>./HelpMan/dpkg.txt
man dpkg >>./HelpMan/dpkg.txt
