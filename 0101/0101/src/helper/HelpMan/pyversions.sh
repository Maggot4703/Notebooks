#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pyversions.txt
which pyversions >>./HelpMan/pyversions.txt
whatis pyversions >>./HelpMan/pyversions.txt
pyversions --help >>./HelpMan/pyversions.txt
man pyversions >>./HelpMan/pyversions.txt
