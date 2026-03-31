#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/python3.8.txt
which python3.8 >>./HelpMan/python3.8.txt
whatis python3.8 >>./HelpMan/python3.8.txt
python3.8 --help >>./HelpMan/python3.8.txt
man python3.8 >>./HelpMan/python3.8.txt
