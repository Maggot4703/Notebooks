#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ranlib.txt
which ranlib >>./HelpMan/ranlib.txt
whatis ranlib >>./HelpMan/ranlib.txt
ranlib --help >>./HelpMan/ranlib.txt
man ranlib >>./HelpMan/ranlib.txt
