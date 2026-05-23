#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/libnetcfg.txt
which libnetcfg >>./HelpMan/libnetcfg.txt
whatis libnetcfg >>./HelpMan/libnetcfg.txt
libnetcfg --help >>./HelpMan/libnetcfg.txt
man libnetcfg >>./HelpMan/libnetcfg.txt
