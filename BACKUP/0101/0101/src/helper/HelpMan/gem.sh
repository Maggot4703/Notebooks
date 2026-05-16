#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gem.txt
which gem >>./HelpMan/gem.txt
whatis gem >>./HelpMan/gem.txt
gem --help >>./HelpMan/gem.txt
man gem >>./HelpMan/gem.txt
