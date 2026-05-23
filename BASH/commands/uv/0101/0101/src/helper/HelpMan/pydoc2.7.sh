#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pydoc2.7.txt
which pydoc2.7 >>./HelpMan/pydoc2.7.txt
whatis pydoc2.7 >>./HelpMan/pydoc2.7.txt
pydoc2.7 --help >>./HelpMan/pydoc2.7.txt
man pydoc2.7 >>./HelpMan/pydoc2.7.txt
