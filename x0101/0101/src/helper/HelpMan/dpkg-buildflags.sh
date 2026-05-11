#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-buildflags.txt
which dpkg-buildflags >>./HelpMan/dpkg-buildflags.txt
whatis dpkg-buildflags >>./HelpMan/dpkg-buildflags.txt
dpkg-buildflags --help >>./HelpMan/dpkg-buildflags.txt
man dpkg-buildflags >>./HelpMan/dpkg-buildflags.txt
