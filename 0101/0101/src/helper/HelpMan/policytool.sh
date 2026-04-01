#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/policytool.txt
which policytool >>./HelpMan/policytool.txt
whatis policytool >>./HelpMan/policytool.txt
policytool --help >>./HelpMan/policytool.txt
man policytool >>./HelpMan/policytool.txt
