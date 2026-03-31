#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pnm2ppa.txt
which pnm2ppa >>./HelpMan/pnm2ppa.txt
whatis pnm2ppa >>./HelpMan/pnm2ppa.txt
pnm2ppa --help >>./HelpMan/pnm2ppa.txt
man pnm2ppa >>./HelpMan/pnm2ppa.txt
