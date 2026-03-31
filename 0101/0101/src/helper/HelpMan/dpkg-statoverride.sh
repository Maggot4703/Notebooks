#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-statoverride.txt
which dpkg-statoverride >>./HelpMan/dpkg-statoverride.txt
whatis dpkg-statoverride >>./HelpMan/dpkg-statoverride.txt
dpkg-statoverride --help >>./HelpMan/dpkg-statoverride.txt
man dpkg-statoverride >>./HelpMan/dpkg-statoverride.txt
