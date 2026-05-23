#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rmic.txt
which rmic >>./HelpMan/rmic.txt
whatis rmic >>./HelpMan/rmic.txt
rmic --help >>./HelpMan/rmic.txt
man rmic >>./HelpMan/rmic.txt
