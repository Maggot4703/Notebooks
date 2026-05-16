#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-architecture.txt
which dpkg-architecture >>./HelpMan/dpkg-architecture.txt
whatis dpkg-architecture >>./HelpMan/dpkg-architecture.txt
dpkg-architecture --help >>./HelpMan/dpkg-architecture.txt
man dpkg-architecture >>./HelpMan/dpkg-architecture.txt
