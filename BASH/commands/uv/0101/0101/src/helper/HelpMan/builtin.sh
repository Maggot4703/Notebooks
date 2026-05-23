#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/builtin.txt
which builtin >>./HelpMan/builtin.txt
whatis builtin >>./HelpMan/builtin.txt
builtin --help >>./HelpMan/builtin.txt
man builtin >>./HelpMan/builtin.txt
