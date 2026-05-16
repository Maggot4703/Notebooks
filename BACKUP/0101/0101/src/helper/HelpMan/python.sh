#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/python.txt
which python >>./HelpMan/python.txt
whatis python >>./HelpMan/python.txt
python --help >>./HelpMan/python.txt
man python >>./HelpMan/python.txt
