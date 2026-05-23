#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/python3.txt
which python3 >>./HelpMan/python3.txt
whatis python3 >>./HelpMan/python3.txt
python3 --help >>./HelpMan/python3.txt
man python3 >>./HelpMan/python3.txt
