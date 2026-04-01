#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aseqnet.txt
which aseqnet >>./HelpMan/aseqnet.txt
whatis aseqnet >>./HelpMan/aseqnet.txt
aseqnet --help >>./HelpMan/aseqnet.txt
man aseqnet >>./HelpMan/aseqnet.txt
