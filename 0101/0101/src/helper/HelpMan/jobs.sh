#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jobs.txt
which jobs >>./HelpMan/jobs.txt
whatis jobs >>./HelpMan/jobs.txt
jobs --help >>./HelpMan/jobs.txt
man jobs >>./HelpMan/jobs.txt
