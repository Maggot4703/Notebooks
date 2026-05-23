#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fakeroot-tcp.txt
which fakeroot-tcp >>./HelpMan/fakeroot-tcp.txt
whatis fakeroot-tcp >>./HelpMan/fakeroot-tcp.txt
fakeroot-tcp --help >>./HelpMan/fakeroot-tcp.txt
man fakeroot-tcp >>./HelpMan/fakeroot-tcp.txt
