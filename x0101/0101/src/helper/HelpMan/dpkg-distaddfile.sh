#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-distaddfile.txt
which dpkg-distaddfile >>./HelpMan/dpkg-distaddfile.txt
whatis dpkg-distaddfile >>./HelpMan/dpkg-distaddfile.txt
dpkg-distaddfile --help >>./HelpMan/dpkg-distaddfile.txt
man dpkg-distaddfile >>./HelpMan/dpkg-distaddfile.txt
