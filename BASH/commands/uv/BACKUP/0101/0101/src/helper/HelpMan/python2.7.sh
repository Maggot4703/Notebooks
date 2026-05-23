#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/python2.7.txt
which python2.7 >>./HelpMan/python2.7.txt
whatis python2.7 >>./HelpMan/python2.7.txt
python2.7 --help >>./HelpMan/python2.7.txt
man python2.7 >>./HelpMan/python2.7.txt
