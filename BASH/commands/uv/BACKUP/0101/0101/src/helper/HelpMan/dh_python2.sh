#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dh_python2.txt
which dh_python2 >>./HelpMan/dh_python2.txt
whatis dh_python2 >>./HelpMan/dh_python2.txt
dh_python2 --help >>./HelpMan/dh_python2.txt
man dh_python2 >>./HelpMan/dh_python2.txt
