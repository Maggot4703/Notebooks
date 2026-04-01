#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/python2.txt
which python2 >>./HelpMan/python2.txt
whatis python2 >>./HelpMan/python2.txt
python2 --help >>./HelpMan/python2.txt
man python2 >>./HelpMan/python2.txt
