#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-trigger.txt
which dpkg-trigger >>./HelpMan/dpkg-trigger.txt
whatis dpkg-trigger >>./HelpMan/dpkg-trigger.txt
dpkg-trigger --help >>./HelpMan/dpkg-trigger.txt
man dpkg-trigger >>./HelpMan/dpkg-trigger.txt
