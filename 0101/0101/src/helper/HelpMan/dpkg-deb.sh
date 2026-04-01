#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-deb.txt
which dpkg-deb >>./HelpMan/dpkg-deb.txt
whatis dpkg-deb >>./HelpMan/dpkg-deb.txt
dpkg-deb --help >>./HelpMan/dpkg-deb.txt
man dpkg-deb >>./HelpMan/dpkg-deb.txt
