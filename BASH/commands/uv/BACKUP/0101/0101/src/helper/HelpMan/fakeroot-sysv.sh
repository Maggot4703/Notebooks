#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fakeroot-sysv.txt
which fakeroot-sysv >>./HelpMan/fakeroot-sysv.txt
whatis fakeroot-sysv >>./HelpMan/fakeroot-sysv.txt
fakeroot-sysv --help >>./HelpMan/fakeroot-sysv.txt
man fakeroot-sysv >>./HelpMan/fakeroot-sysv.txt
