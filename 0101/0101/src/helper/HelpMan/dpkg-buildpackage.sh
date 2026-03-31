#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-buildpackage.txt
which dpkg-buildpackage >>./HelpMan/dpkg-buildpackage.txt
whatis dpkg-buildpackage >>./HelpMan/dpkg-buildpackage.txt
dpkg-buildpackage --help >>./HelpMan/dpkg-buildpackage.txt
man dpkg-buildpackage >>./HelpMan/dpkg-buildpackage.txt
