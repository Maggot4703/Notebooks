#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-preconfigure.txt
which dpkg-preconfigure >>./HelpMan/dpkg-preconfigure.txt
whatis dpkg-preconfigure >>./HelpMan/dpkg-preconfigure.txt
dpkg-preconfigure --help >>./HelpMan/dpkg-preconfigure.txt
man dpkg-preconfigure >>./HelpMan/dpkg-preconfigure.txt
