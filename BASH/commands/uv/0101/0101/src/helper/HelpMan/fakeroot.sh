#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fakeroot.txt
which fakeroot >>./HelpMan/fakeroot.txt
whatis fakeroot >>./HelpMan/fakeroot.txt
fakeroot --help >>./HelpMan/fakeroot.txt
man fakeroot >>./HelpMan/fakeroot.txt
