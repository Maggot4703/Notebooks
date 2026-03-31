#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-parsechangelog.txt
which dpkg-parsechangelog >>./HelpMan/dpkg-parsechangelog.txt
whatis dpkg-parsechangelog >>./HelpMan/dpkg-parsechangelog.txt
dpkg-parsechangelog --help >>./HelpMan/dpkg-parsechangelog.txt
man dpkg-parsechangelog >>./HelpMan/dpkg-parsechangelog.txt
