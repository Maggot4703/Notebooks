#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/g++-9.txt
which g++-9 >>./HelpMan/g++-9.txt
whatis g++-9 >>./HelpMan/g++-9.txt
g++-9 --help >>./HelpMan/g++-9.txt
man g++-9 >>./HelpMan/g++-9.txt
