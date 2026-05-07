#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/perl.txt
which perl >>./HelpMan/perl.txt
whatis perl >>./HelpMan/perl.txt
perl --help >>./HelpMan/perl.txt
man perl >>./HelpMan/perl.txt
