#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/py3clean.txt
which py3clean >>./HelpMan/py3clean.txt
whatis py3clean >>./HelpMan/py3clean.txt
py3clean --help >>./HelpMan/py3clean.txt
man py3clean >>./HelpMan/py3clean.txt
