#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/shift.txt
which shift >>./HelpMan/shift.txt
whatis shift >>./HelpMan/shift.txt
shift --help >>./HelpMan/shift.txt
man shift >>./HelpMan/shift.txt
