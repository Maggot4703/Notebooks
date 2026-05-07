#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bunzip2.txt
which bunzip2 >>./HelpMan/bunzip2.txt
whatis bunzip2 >>./HelpMan/bunzip2.txt
bunzip2 --help >>./HelpMan/bunzip2.txt
man bunzip2 >>./HelpMan/bunzip2.txt
