#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/zipdetails.txt
which zipdetails >>./HelpMan/zipdetails.txt
whatis zipdetails >>./HelpMan/zipdetails.txt
zipdetails --help >>./HelpMan/zipdetails.txt
man zipdetails >>./HelpMan/zipdetails.txt
