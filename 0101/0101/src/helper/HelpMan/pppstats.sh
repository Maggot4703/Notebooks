#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pppstats.txt
which pppstats >>./HelpMan/pppstats.txt
whatis pppstats >>./HelpMan/pppstats.txt
pppstats --help >>./HelpMan/pppstats.txt
man pppstats >>./HelpMan/pppstats.txt
