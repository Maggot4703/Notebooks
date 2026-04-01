#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cpan.txt
which cpan >>./HelpMan/cpan.txt
whatis cpan >>./HelpMan/cpan.txt
cpan --help >>./HelpMan/cpan.txt
man cpan >>./HelpMan/cpan.txt
