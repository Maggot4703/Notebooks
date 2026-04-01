#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/py3compile.txt
which py3compile >>./HelpMan/py3compile.txt
whatis py3compile >>./HelpMan/py3compile.txt
py3compile --help >>./HelpMan/py3compile.txt
man py3compile >>./HelpMan/py3compile.txt
