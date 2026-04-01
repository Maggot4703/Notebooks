#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-scanpackages.txt
which dpkg-scanpackages >>./HelpMan/dpkg-scanpackages.txt
whatis dpkg-scanpackages >>./HelpMan/dpkg-scanpackages.txt
dpkg-scanpackages --help >>./HelpMan/dpkg-scanpackages.txt
man dpkg-scanpackages >>./HelpMan/dpkg-scanpackages.txt
