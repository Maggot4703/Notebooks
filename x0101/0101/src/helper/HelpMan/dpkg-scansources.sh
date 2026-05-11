#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-scansources.txt
which dpkg-scansources >>./HelpMan/dpkg-scansources.txt
whatis dpkg-scansources >>./HelpMan/dpkg-scansources.txt
dpkg-scansources --help >>./HelpMan/dpkg-scansources.txt
man dpkg-scansources >>./HelpMan/dpkg-scansources.txt
