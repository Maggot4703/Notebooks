#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/visudo.txt
which visudo >>./HelpMan/visudo.txt
whatis visudo >>./HelpMan/visudo.txt
visudo --help >>./HelpMan/visudo.txt
man visudo >>./HelpMan/visudo.txt
