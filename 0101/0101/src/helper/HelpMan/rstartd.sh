#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rstartd.txt
which rstartd >>./HelpMan/rstartd.txt
whatis rstartd >>./HelpMan/rstartd.txt
rstartd --help >>./HelpMan/rstartd.txt
man rstartd >>./HelpMan/rstartd.txt
