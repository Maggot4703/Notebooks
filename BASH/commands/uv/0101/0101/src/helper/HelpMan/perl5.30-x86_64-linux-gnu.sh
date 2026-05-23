#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/perl5.30-x86_64-linux-gnu.txt
which perl5.30-x86_64-linux-gnu >>./HelpMan/perl5.30-x86_64-linux-gnu.txt
whatis perl5.30-x86_64-linux-gnu >>./HelpMan/perl5.30-x86_64-linux-gnu.txt
perl5.30-x86_64-linux-gnu --help >>./HelpMan/perl5.30-x86_64-linux-gnu.txt
man perl5.30-x86_64-linux-gnu >>./HelpMan/perl5.30-x86_64-linux-gnu.txt
