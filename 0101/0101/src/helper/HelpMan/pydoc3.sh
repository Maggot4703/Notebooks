#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pydoc3.txt
which pydoc3 >>./HelpMan/pydoc3.txt
whatis pydoc3 >>./HelpMan/pydoc3.txt
pydoc3 --help >>./HelpMan/pydoc3.txt
man pydoc3 >>./HelpMan/pydoc3.txt
