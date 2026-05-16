#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-reconfigure.txt
which dpkg-reconfigure >>./HelpMan/dpkg-reconfigure.txt
whatis dpkg-reconfigure >>./HelpMan/dpkg-reconfigure.txt
dpkg-reconfigure --help >>./HelpMan/dpkg-reconfigure.txt
man dpkg-reconfigure >>./HelpMan/dpkg-reconfigure.txt
