#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/py3versions.txt
which py3versions >>./HelpMan/py3versions.txt
whatis py3versions >>./HelpMan/py3versions.txt
py3versions --help >>./HelpMan/py3versions.txt
man py3versions >>./HelpMan/py3versions.txt
