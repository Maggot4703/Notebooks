#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/h2ph.txt
which h2ph >>./HelpMan/h2ph.txt
whatis h2ph >>./HelpMan/h2ph.txt
h2ph --help >>./HelpMan/h2ph.txt
man h2ph >>./HelpMan/h2ph.txt
