#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-gencontrol.txt
which dpkg-gencontrol >>./HelpMan/dpkg-gencontrol.txt
whatis dpkg-gencontrol >>./HelpMan/dpkg-gencontrol.txt
dpkg-gencontrol --help >>./HelpMan/dpkg-gencontrol.txt
man dpkg-gencontrol >>./HelpMan/dpkg-gencontrol.txt
