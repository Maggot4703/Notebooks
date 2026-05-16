#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/thermald.txt
which thermald >>./HelpMan/thermald.txt
whatis thermald >>./HelpMan/thermald.txt
thermald --help >>./HelpMan/thermald.txt
man thermald >>./HelpMan/thermald.txt
