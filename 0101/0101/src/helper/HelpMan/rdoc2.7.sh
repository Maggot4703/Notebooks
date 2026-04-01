#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rdoc2.7.txt
which rdoc2.7 >>./HelpMan/rdoc2.7.txt
whatis rdoc2.7 >>./HelpMan/rdoc2.7.txt
rdoc2.7 --help >>./HelpMan/rdoc2.7.txt
man rdoc2.7 >>./HelpMan/rdoc2.7.txt
