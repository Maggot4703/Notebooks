#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cpan5.30-x86_64-linux-gnu.txt
which cpan5.30-x86_64-linux-gnu >>./HelpMan/cpan5.30-x86_64-linux-gnu.txt
whatis cpan5.30-x86_64-linux-gnu >>./HelpMan/cpan5.30-x86_64-linux-gnu.txt
cpan5.30-x86_64-linux-gnu --help >>./HelpMan/cpan5.30-x86_64-linux-gnu.txt
man cpan5.30-x86_64-linux-gnu >>./HelpMan/cpan5.30-x86_64-linux-gnu.txt
