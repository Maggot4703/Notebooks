#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-genchanges.txt
which dpkg-genchanges >>./HelpMan/dpkg-genchanges.txt
whatis dpkg-genchanges >>./HelpMan/dpkg-genchanges.txt
dpkg-genchanges --help >>./HelpMan/dpkg-genchanges.txt
man dpkg-genchanges >>./HelpMan/dpkg-genchanges.txt
